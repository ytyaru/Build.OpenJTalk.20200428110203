#!/bin/bash
OPENJTALK_VOICE_DIR="$HOME/root/sys/env/tool/openjtalk/voice/"
OPENJTALK_DEFAULT_VOICE="$HOME/root/sys/env/tool/openjtalk/voice/MMDAgent_Example-1.8/Voice/mei/mei_normal.htsvoice"
GetVoices() { # $1: PATH_DIR(option)
	local PATH_DEFAULT="${1:-$OPENJTALK_VOICE_DIR}"
	local PATH_DIR="${1:-$PATH_DEFAULT}"
	echo "$(find "${PATH_DIR}" -name *.htsvoice)"
}
GetDefaultVoice() { # $1: PATH_DIR(option)
	local PATH_DEFAULT="${1:-$OPENJTALK_VOICE_DIR}"
	local names=(
		"mei_normal.htsvoice"	# ---------1
		"tohoku-f01-neutral.htsvoice"
		"takumi_normal.htsvoice"
		"type-beta.htsvoice"
		"蒼歌ネロ.htsvoice"
		"ワタシ.htsvoice"
		"緋惺.htsvoice"
		"天月りよん.htsvoice"
		"nitech_jp_atr503_m001.htsvoice"
		"白狐舞.htsvoice"		# ---------2
		"なないろニジ.htsvoice"
		"空唄カナタ.htsvoice"
		"薪宮風季.htsvoice" 
		"遊音一莉.htsvoice"		# ---------3
		"唱地ヨエ.htsvoice"
		"句音コノ。.htsvoice"	# ---------4
		"月音ラミ_1.0.htsvoice"
	)
	for name in "${names[@]}"; do
		path="$(find "$(cd "${PATH_DEFAULT}"; pwd)" -name "${name}")"
		[ -f "${path}" ] && { echo "${path}"; return; }
	done
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
jtalk() {
	local MESSAGE="${1:-こんにちは。これはテスト用メッセージです。}"
	local VOICE="$(GetDefaultVoice)"
	OpenJTalk "$MESSAGE" "$VOICE"
}
