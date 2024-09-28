source $HOME/.config/zsh-vi-mode/zsh-vi-mode-edit-command-line.zsh

# enable vi mode
bindkey -v


bindkey -M main "^?" backward-delete-char

# unbind all keys in vicmd mode
bindkey -M vicmd -rp ''

# navigation
bindkey -M vicmd "h" vi-backward-char
bindkey -M vicmd "j" down-line-or-history
bindkey -M vicmd "k" up-line-or-history
bindkey -M vicmd "l" vi-forward-char

bindkey -M vicmd "0" vi-digit-or-beginning-of-line
bindkey -M vicmd "\^" vi-first-non-blank
bindkey -M vicmd "\$" vi-end-of-line

bindkey -M vicmd "b" vi-backward-word
bindkey -M vicmd "B" vi-backward-blank-word
bindkey -M vicmd "w" vi-forward-word
bindkey -M vicmd "W" vi-forward-blank-word
bindkey -M vicmd "e" vi-forward-word-end
bindkey -M vicmd "E" vi-forward-blank-word-end

bindkey -M vicmd "t" vi-find-next-char-skip
bindkey -M vicmd "T" vi-find-prev-char-skip
bindkey -M vicmd "f" vi-find-next-char
bindkey -M vicmd "F" vi-find-prev-char

bindkey -M vicmd "a" vi-add-next
bindkey -M vicmd "s" vi-substitute
bindkey -M vicmd "S" vi-change-whole-line
bindkey -M vicmd "c" vi-change
bindkey -M vicmd "C" vi-change-eol
bindkey -M vicmd "r" vi-replace-chars
bindkey -M vicmd "R" vi-replace

bindkey -M vicmd "d" vi-delete
bindkey -M vicmd "D" vi-kill-eol
bindkey -M vicmd "x" vi-delete-char
bindkey -M vicmd "X" vi-backward-delete-char

# copy & paste
bindkey -M vicmd "p" vi-put-after
bindkey -M vicmd "P" vi-put-before
bindkey -M vicmd "y" vi-yank
bindkey -M vicmd "Y" vi-yank-whole-line

# undo & redo
bindkey -M vicmd "u" undo
bindkey -M vicmd "^R" redo

# mode switching
bindkey -M vicmd "i" vi-insert
bindkey -M vicmd "^[" vi-insert
bindkey -M vicmd "v" visual-mode
bindkey -M vicmd "V" visual-line-mode
bindkey -M visual "v" _edit_command_line
