#!/bin/bash
OPENJTALK_VOICE_DIR="${OPENJTALK_VOICE_DIR:-$HOME/root/sys/env/tool/openjtalk/voice/}"
OPENJTALK_VOICE_PATHS=""
GetVoices() { # $1...: PATH_DIR(option)
	[ -n "$OPENJTALK_VOICE_PATHS" ] && { echo -e "$OPENJTALK_VOICE_PATHS"; return; }
	local paths=()
	for arg in "$@"; do { paths+=("$arg"); } done
	paths+=("$OPENJTALK_VOICE_DIR")
	paths+=("/usr/share/hts-voice/")
	for path in "${paths[@]}"; do
		[ ! -d "$path" ] && continue
		local file_path="$(find "$(cd "${path}"; pwd)" -name *.htsvoice)"
		OPENJTALK_VOICE_PATHS+="${file_path}\n"
	done
	echo -e "$OPENJTALK_VOICE_PATHS" | sed  '/^$/d'
}
GetDefaultVoice() { # $1: PATH_DIR(option)
	local names=(
		"mei_normal"	# ---------1
		"tohoku-f01-neutral"
		"takumi_normal"
		"type-beta"
		"蒼歌ネロ"
		"ワタシ"
		"緋惺"
		"天月りよん"
		"nitech_jp_atr503_m001"
		"白狐舞"		# ---------2
		"なないろニジ"
		"空唄カナタ"
		"薪宮風季" 
		"遊音一莉"		# ---------3
		"唱地ヨエ"
		"句音コノ。"	# ---------4
		"月音ラミ_1.0"
	)
	for name in "${names[@]}"; do
		path="$(echo "$(GetVoices "$@")" | grep -m1 "${name}.htsvoice")"
		[ -f "${path}" ] && { echo "${path}"; return; }
	done
}
SearchVoice() {
	echo "$(GetVoices "$@")" | grep -m1 "$1.htsvoice"
}
GetRandomVoice() { # $1: PATH_DIR(option)
	local PATHS="$(GetVoices "$@")"
	local COUNT=$(echo "${PATHS}" | wc -l)
	local SELECTED=$(($RANDOM % $COUNT))
	echo -e "$PATHS" | head -n ${SELECTED} | tail -n 1
}
GetDefaultDic() {
	local paths=(
		"/var/lib/mecab/dic/open-jtalk/naist-jdic"
	)
	for path in "${paths[@]}"; do
		[ -d "${path}" ] && { echo "${path}"; return; }
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
	error=$?; [ $error -ne 0 ] && { echo "ERROR: OpenJTalk $MESSAGE\n$VOICE\n$OUTPUT"; }
}
Run() { # jtalk
	Help() {
		local text="$(cat <<-EOS
			音声合成する。日本語。OpenJTalkを使う。
			Usage:
			  jtalk MESSAGE [VOICE]
			Parameters:
			  MESSAGE  発話させたいテキスト
			  VOICE    発話させたい.htsvoiceファイルパス
			Env:
			  OPENJTALK_VOICE_DIR  .htsvoiceがあるルートディレクトリ
			    "${OPENJTALK_VOICE_DIR}"
			Examples:
			  jtalk これを読み上げます
			  jtalk -r 声をランダムにします
			  jtalk -v type-beta 初音ミクです
			  jtalk -o /tmp/work/a.wav 音声ファイルに録音します
			This: "$(realpath "${BASH_SOURCE:-0}")"
			Voices:
			  $(echo "$(GetVoices)" | sed -r 's/(.+)\/(.+)\.htsvoice/\2/g' | uniq | sort | tr '\n' ' ')
		EOS
		)"
		echo "$text"
	}
	local OPT_IS_RANDOM_VOICE=0
	local OPT_SELECTED_VOICE="$(GetDefaultVoice)"
	local OPT_SELECTED_DIC_PATH="$(GetDefaultDic)"
	local OPT_OUTPUT_FILE_PATH="/dev/stdout"
	local OPT_SPEED="1.0" # -r 1.0
	local OPT_VOLUME="0.0" # -g 0.0
	while getopts ':rv:o:d:h' OPT; do
		case $OPT in
		r) OPT_SELECTED_VOICE="$(GetRandomVoice)" ;;
		v) OPT_SELECTED_VOICE="$(SearchVoice "$OPTARG")" ;;
		d) OPT_SELECTED_DIC_PATH="$OPTARG" ;;
		o) OPT_OUTPUT_FILE_PATH="$OPTARG" ;;
		h) Help; return;;
		:) echo  "[ERROR] 値が必要なオプションに値が指定されていません。"; Help;;   # 
		\?) echo "[ERROR] 未定義のオプションです。"; Help;;
		esac
	done
	shift $(($OPTIND - 1))
	echo "VOICE: ${OPT_SELECTED_VOICE}"
	echo "DIC:   ${OPT_SELECTED_DIC_PATH}"
	echo "OUT:   ${OPT_OUTPUT_FILE_PATH}"
	local MESSAGE="${1:-こんにちは。これはテスト用メッセージです。}"
	echo "MSG:   ${MESSAGE}"
	OpenJTalkCmd() {
		local VOICE="$OPT_SELECTED_VOICE"
		local DIC="$OPT_SELECTED_DIC_PATH"
		local OUTPUT="$OPT_OUTPUT_FILE_PATH"
		echo "open_jtalk -x \"$DIC\" -m \"$VOICE\" -ow \"$OUTPUT\" -r $OPT_SPEED -g $OPT_VOLUME "
	}
	AplayCmd() {
		local OUTPUT="$OPT_OUTPUT_FILE_PATH"
		[ "$OUTPUT" = '/dev/stdout' ] && { echo ' | aplay'; return; }
		echo " ; aplay \"${OUTPUT}\"; "
	}
	local cmd="echo \"$MESSAGE\" | $(OpenJTalkCmd) $(AplayCmd)"
	echo "${cmd}"
	eval "${cmd}"
}
Run "$@"

