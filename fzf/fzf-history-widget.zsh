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

# CTRL-R - Paste the selected command from history into the command line
fzf-history-widget() {
    local selected num
    setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
    selected="$(fc -rl 1 | awk '{ cmd=$0; sub(/^[ \t]*[0-9]+\**[ \t]+/, "", cmd); if (!seen[cmd]++) print $0 }' |
        FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} ${FZF_DEFAULT_OPTS-} -n2..,.. --scheme=history --bind=ctrl-r:toggle-sort,ctrl-z:ignore ${FZF_CTRL_R_OPTS-} --query=${(qqq)LBUFFER} +m" fzf)"
            local ret=$?
            if [ -n "$selected" ]; then
                num=$(awk '{print $1}' <<< "$selected")
                if [[ "$num" =~ '^[1-9][0-9]*\*?$' ]]; then
                    zle vi-fetch-history -n ${num%\*}
                else # selected is a custom query, not from history
                    LBUFFER="$selected"
                fi
            fi
            zle reset-prompt
            return $ret
}
zle     -N            fzf-history-widget
bindkey -M emacs '^R' fzf-history-widget
bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget

} always {
eval $__fzf_key_bindings_options
'unset' '__fzf_key_bindings_options'
}
