#!/bin/bash
OPENJTALK_VOICE_DIR="${OPENJTALK_VOICE_DIR:-$HOME/root/sys/env/tool/openjtalk/voice/}"
GetVoices() { # $1: PATH_DIR(option)
	local paths=()
	[ 0 -lt $# ] && paths+=("$1")
	paths+=("$OPENJTALK_VOICE_DIR")
	paths+=("/usr/share/hts-voice/")
	for path in "${paths[@]}"; do
		[ -d "$path" ] && echo "$(find "$(cd "${PATH_DEFAULT}"; pwd)" -name *.htsvoice)"
	done
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
GetDefaultDic() {
	local paths=(
		"/var/lib/mecab/dic/open-jtalk/naist-jdic"
	)
	for path in "${names[@]}"; do
		[ -f "${path}" ] && { echo "${path}"; return; }
	done
	echo '/usr/local/dic'
}
OpenJTalk() { # $1: message(option), $2: voice(option), $3: output:(option:/dev/stdout)
	local MESSAGE="${1:-こんにちは。これはテスト用メッセージです。}"
	local VOICE="${2:-$(GetRandomVoice)}"
	local OUTPUT="${3:-/dev/stdout}"
	local DIC="$(GetDefaultDic)"
	local cmd_aplay_file=""
	[ "$OUTPUT" != '/dev/stdout' ] && cmd_aplay_file="\"${OUTPUT}\""
	local cmd_aplay=" | aplay ${cmd_aplay_file}"
	local cmd="echo \"$MESSAGE\" | open_jtalk -x \"$DIC\" -m \"$VOICE\" -ow \"$OUTPUT\" $cmd_aplay"
	eval "${cmd}"
#	echo "$cmd_aplay"
#	echo "$MESSAGE" | open_jtalk \
#		-x /usr/local/dic \
#		-m "$VOICE" \
#		-ow "${OUTPUT}" \
#		"${cmd_aplay}"
##		| aplay
	error=$?; [ $error -ne 0 ] && { echo "ERROR: OpenJTalk $MESSAGE\n$VOICE\n$OUTPUT"; }
}
jtalk() {
#	local MESSAGE="${1:-こんにちは。これはテスト用メッセージです。}"
#	local VOICE="$(GetDefaultVoice)"
#	OpenJTalk "$MESSAGE" "$VOICE"
	local OPT_IS_RANDOM_VOICE=0
	local OPT_SELECTED_VOICE="$(GetDefaultVoice)"
	local OPT_SELECTED_DIC_PATH="$(GetDefaultDic)"
	local OPT_OUTPUT_FILE_PATH="/dev/stdout"
	local OPT_SPEED="1.0" # -r 1.0
	local OPT_VOLUME="1.0" # -g 0.0
	while getopts ":hro:" OPT; do
		case $OPT in
		r) OPT_SELECTED_VOICE="$(GetRandomVoice)" ;;
		v) OPT_SELECTED_VOICE="$OPTARG" ;;
		d) OPT_SELECTED_DIC_PATH="$OPTARG" ;;
		o) OPT_OUTPUT_FILE_PATH="$OPTARG" ;;
		h) echo  "Help";;
		:) echo  "[ERROR] Option argument is undefined.";;   # 
		\?) echo "[ERROR] Undefined options.";;
		esac
	done
	shift $(($OPTIND - 1))
	echo "${OPT_SELECTED_VOICE}"
	echo "${OPT_SELECTED_DIC_PATH}"
	echo "${OPT_OUTPUT_FILE_PATH}"
#	echo "${}"
#	echo "${}"
	local MESSAGE="${1:-こんにちは。これはテスト用メッセージです。}"
	echo "${MESSAGE}"
	OpenJTalkCmd() {
		local VOICE="$OPT_SELECTED_VOICE"
		local DIC="$OPT_SELECTED_DIC_PATH"
		local OUTPUT="$OPT_OUTPUT_FILE_PATH"
		echo "open_jtalk -x \"$DIC\" -m \"$VOICE\" -ow \"$OUTPUT\" -r $OPT_SPEED -g $OPT_VOLUME "
	}
	AplayCmd() {
		local OUTPUT="$OPT_OUTPUT_FILE_PATH"
		local cmd_aplay_file=""
		[ "$OUTPUT" != '/dev/stdout' ] && cmd_aplay_file="\"${OUTPUT}\""
		local cmd_aplay="aplay ${cmd_aplay_file} "
		echo "$cmd_aplay"
	}
	local cmd="echo \"$MESSAGE\" | $(OpenJTalkCmd) | $(AplayCmd)"
	echo "${cmd}"
	eval "${cmd}"
#	OpenJTalk "$MESSAGE" "$OPT_SELECTED_VOICE" "$OPT_OUTPUT_FILE_PATH"
}
jtalk 'こんにちは'
