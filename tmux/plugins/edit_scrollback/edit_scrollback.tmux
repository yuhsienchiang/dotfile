#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SRC_DIR="$CURRENT_DIR/src"

default_key_binding="b"
default_cache_dir="$XDG_CACHE_HOME/scrollback"
default_keep_temp_file="prompt"

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
    local keep_temp_file=$(get_tmux_option "@edit_scrollback_keep_temp_file" "$default_keep_temp_file")

    if [ ! -d "$cache_dir" ]; then
        mkdir -p "$cache_dir"
    fi

    local key_binding=$(get_tmux_option "@edit_scrollback_key" "$default_key_binding")
    tmux bind-key "$key_binding" run-shell "$SRC_DIR/edit_scrollback.sh $cache_dir $keep_temp_file"
}

main
