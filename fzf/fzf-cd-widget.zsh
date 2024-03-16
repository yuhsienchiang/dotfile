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

# ALT-C - cd into the selected directory
fzf-cd-widget() {
    setopt localoptions pipefail no_aliases 2> /dev/null
    local dir="$(FZF_DEFAULT_COMMAND=${FZF_ALT_C_COMMAND:-} FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --walker=dir,follow,hidden --scheme=path --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} ${FZF_ALT_C_OPTS-}" fzf +m < /dev/tty)"
    if [[ -z "$dir" ]]; then
        zle redisplay
        return 0
    fi
    zle push-line # Clear buffer. Auto-restored on next prompt.
    BUFFER="cd ${(q)dir}"
    zle accept-line
    local ret=$?
    unset dir # ensure this doesn't end up appearing in prompt expansion
    zle reset-prompt
    return $ret
}
zle     -N            fzf-cd-widget
bindkey -M emacs '^F' fzf-cd-widget
bindkey -M vicmd '^F' fzf-cd-widget
bindkey -M viins '^F' fzf-cd-widget

} always {
eval $__fzf_key_bindings_options
'unset' '__fzf_key_bindings_options'
}
