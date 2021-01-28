#!/bin/bash
OPENJTALK_VOICE_DIR="$HOME/root/sys/env/tool/openjtalk/voice/"
GetVoices() { # $1: PATH_DIR(option)
	local PATH_DEFAULT="${1:-$OPENJTALK_VOICE_DIR}"
	local PATH_DIR="${1:-$PATH_DEFAULT}"
	echo "$(find "${PATH_DIR}" -name *.htsvoice)"
}
GetRandomVoice() { # $1: PATH_DIR(option)
	local PATHS="$(GetVoices "$1")"
	local COUNT=$(echo "${PATHS}" | wc -l)
	local SELECTED=$(($RANDOM % $COUNT))
	echo -e "$PATHS" | head -n ${SELECTED} | tail -n 1
}
OpenJTalk() { # $1: message(option), $2: voice(option), $3: output:(option:/dev/stdout)
	local MESSAGE="${1:-こんにちは。これはテスト用メッセージです。}"
	local VOICE="${2:-$(GetRandomVoice)}"
	local OUTPUT="${3:-/dev/stdout}"
	echo "$MESSAGE" | open_jtalk \
		-x /usr/local/dic \
		-m "$VOICE" \
		-ow "${OUTPUT}" \
		| aplay
	error=$?; [ $error -ne 0 ] && { echo "ERROR: OpenJTalk $MESSAGE\n$VOICE\n$OUTPUT"; }
}

