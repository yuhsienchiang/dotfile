#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

default_key_binding="b"
default_cache_dir="$XDG_CACHE_HOME/scrollback"

get_tmux_option() {
	local option="$1"
	local default_value="$2"
	local option_value="$(tmux show-option -gqv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

main() {
    local cache_dir=$(get_tmux_option "@edit_scrollback_cache_dir" "$default_cache_dir")
    if [ ! -d "$cache_dir" ]; then
        mkdir -p "$cache_dir"
    fi

    local key_binding=$(get_tmux_option "@edit_scrollback_key" "$default_key_binding")
    tmux bind-key "$key_binding" run-shell "$CURRENT_DIR/src/edit_scrollback.sh $cache_dir"
}

main
