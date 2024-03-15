[[ -o interactive ]] || return 0

if 'zmodload' 'zsh/parameter' 2>'/dev/null' && (( ${+options} )); then
    __fzf_key_bindings_options="options=(${(j: :)${(kv)options[@]}})"
else
    () {
    __fzf_key_bindings_options="setopt"
    'local' '__fzf_opt'
    for __fzf_opt in "${(@)${(@f)$(set -o)}%% *}"; do
        if [[ -o "$__fzf_opt" ]]; then
            __fzf_key_bindings_options+=" -o $__fzf_opt"
        else
            __fzf_key_bindings_options+=" +o $__fzf_opt"
        fi
    done
}
fi

'builtin' 'emulate' 'zsh' && 'builtin' 'setopt' 'no_aliases'

{

# CTRL-T - Paste the selected file path(s) into the command line
__fsel() {
    setopt localoptions pipefail no_aliases 2> /dev/null
    local item
    FZF_DEFAULT_COMMAND="fd -td -tf -tx -tl --hidden --follow --no-ignore-vcs" FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --walker=file,dir,follow,hidden --scheme=path --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_CTRL_T_OPTS-}" fzf -m "$@" < /dev/tty | while read item; do echo -n "${(q)item} "; done
    local ret=$?
    echo
    return $ret
}

fzf-file-widget() {
    LBUFFER="${LBUFFER}$(__fsel)"
    local ret=$?
    zle reset-prompt
    return $ret
}

zle     -N            fzf-file-widget
bindkey -M emacs '^T' fzf-file-widget
bindkey -M vicmd '^T' fzf-file-widget
bindkey -M viins '^T' fzf-file-widget

} always {
eval $__fzf_key_bindings_options
'unset' '__fzf_key_bindings_options'
}
