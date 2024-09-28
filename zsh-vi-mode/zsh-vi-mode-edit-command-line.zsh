function _edit_command_line() {
  # Create a temporary file and save the BUFFER to it
  local tmp_file=$(mktemp $HOME/.cache/zsh-vi-XXXXXX)

  # Some users may config the noclobber option to prevent from
  # overwriting existing files with the > operator, we should
  # use >! operator to ignore the noclobber.
  echo "$BUFFER" >! "$tmp_file"

  # Edit the file with the specific editor, in case of
  # the warning about input not from a terminal (e.g.
  # vim), we should tell the editor input is from the
  # terminal and not from standard input.
  "${(@Q)${(z)${EDITOR}}}" $tmp_file </dev/tty

  # Reload the content to the BUFFER from the temporary
  # file after editing, and delete the temporary file.
  BUFFER=$(cat $tmp_file)
  rm -f "$tmp_file"

  case "$VI_KEYMAP" in
      VISUAL)
          zle visual-mode
          zle redisplay
          ;;
      V-LINE)
          zle visual-line-mode
          zle redisplay
          ;;
  esac
  # zle visual-mode
  zle vi-cmd-mode
  zle vi-end-of-line
}
zle     -N            _edit_command_line
