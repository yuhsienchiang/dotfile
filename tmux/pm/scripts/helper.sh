#!/usr/bin/env bash

TMUX_DIR="$XDG_CONFIG_HOME/tmux"
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SCRIPTS_DIR="$CURRENT_DIR/scripts"
u
PLUGINS_DIR="$TMUX_DIR/plugins"

plugin_dir_exists() {
	[ -d "$1" ]
}

plugin_path_helper() {
	local plugin_name="$1"
	echo "${PLUGINS_DIR}/${plugin_name}/"
}

silently_source_all_tmux_files() {
	local plugin_path="$1"
	local plugin_tmux_files="$plugin_path*.tmux"
	if plugin_dir_exists "$plugin_path"; then
		for tmux_file in $plugin_tmux_files; do
			# if the glob didn't find any files this will be the
			# unexpanded glob which obviously doesn't exist
			[ -f "$tmux_file" ] || continue
			# runs *.tmux file as an executable
			$tmux_file >/dev/null 2>&1
		done
	fi
}

tpm_plugins_list_helper() {
	# read set -g @plugin "tmux-plugins/tmux-example-plugin" entries
    awk '/^[ \t]*set(-option)? +-g +@plugin/ { gsub(/'\''/,""); gsub(/'\"'/,""); print $4 }' "${XDG_CONFIG_HOME}/tmux/.tmux.conf"
}
