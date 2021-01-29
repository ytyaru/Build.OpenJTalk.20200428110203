#!/bin/bash
Run() { # daihon.sh
	local SCRIPT_DIR="$(cd $(dirname $0); pwd)"
	local talker="$SCRIPT_DIR/jtalk.sh"
	local daihon_path="${1:-$SCRIPT_DIR/daihon.tsv}"
#	local daihon="$(cat $daihon_path)"
	IFS=$'\n'
	local daihon=($(cat $daihon_path))
	for line in "${daihon[@]}"; do
		echo "$line"
		local voice="$(echo -e "$line" | cut -f1)"
		local serif="$(echo -e "$line" | cut -f2)"
		$talker -v "$voice" "$serif" > /dev/null
	done
}
Run "$@"

