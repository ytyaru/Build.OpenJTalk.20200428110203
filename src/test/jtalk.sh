#!/bin/bash
OPENJTALK_VOICE_DIR="${OPENJTALK_VOICE_DIR:-$HOME/root/sys/env/tool/openjtalk/voice/}"
#OPENJTALK_VOICE_PATHS=""
Run() { # jtalk
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
	GetGreenlistVoices() { # 高品質（非black）
		[ -n "$OPENJTALK_GREEN_VOICE_PATHS" ] && { echo -e "$OPENJTALK_GREEN_VOICE_PATHS"; return; }
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
			"闇夜 桜_1.0"
			"薪宮風季" 
			"遊音一莉"		# ---------3
			"唱地ヨエ"
			"句音コノ。"	# ---------4
			"月音ラミ_1.0"
		)
		for name in "${names[@]}"; do
			path="$(echo "$(GetVoicesWithoutBlacklist "$@")" | grep -m1 "${name}.htsvoice")"
			[ -f "${path}" ] && { OPENJTALK_GREEN_VOICE_PATHS+="${path}\n"; }
		done
		OPENJTALK_GREEN_VOICE_PATHS="$(echo -e "$OPENJTALK_GREEN_VOICE_PATHS" | sed  '/^$/d')"
		echo -e "$OPENJTALK_GREEN_VOICE_PATHS"
	}
	GetBlacklistVoices() { # Error: Dictionary or HTS voice cannot be loaded.
		cat <<-EOS
			cmu_us_arctic_slt
			H-09
			海賊まさver5
			雪音ルウ２
		EOS
	}
	GetVoicesWithoutBlacklist() {
		[ -n "$OPENJTALK_VALID_VOICE_PATHS" ] && { echo -e "$OPENJTALK_VALID_VOICE_PATHS"; return; }
		local PATHS="$(GetVoices "$@")"
		local blacks=($(IFS=$'\n'; echo -e "$(GetBlacklistVoices)"))
		local result="$PATHS"
		for black in "${blacks[@]}"; do
			result="$(echo -e "$result" | sed -r "/${black}.htsvoice$/d")"
		done
		OPENJTALK_VALID_VOICE_PATHS="$(echo -e "$result" | sed  '/^$/d')"
		echo -e "$OPENJTALK_VALID_VOICE_PATHS"
	}
	GetNormallistVoice() {
		[ -n "$OPENJTALK_NORMAL_VOICE_PATHS" ] && { echo -e "$OPENJTALK_NORMAL_VOICE_PATHS"; return; }
		OPENJTALK_NORMAL_VOICE_PATHS="$(sort <(GetVoicesWithoutBlacklist) <(GetGreenlistVoices) | uniq -u)"
		echo -e "$OPENJTALK_NORMAL_VOICE_PATHS"
	}
	SearchVoice() {
		echo "$(GetVoicesWithoutBlacklist "$@")" | grep -m1 "$1.htsvoice"
	}
	GetRandomVoice() {
		local PATHS="$(cat -)"
		local COUNT=$(echo -e "${PATHS}" | wc -l)
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
	Help() {
		local this_path="$(realpath "${BASH_SOURCE:-0}")"
		local this="$(basename "$this_path")"
		cat <<-EOS
			音声合成する。日本語。OpenJTalkを使う。	v0.0.1
			Usage: $this [options] MESSAGE
			Options:
			  -r       声をランダムにする（ブラックリスト除外）
			  -R       声をランダムにする（グリーンリストのみ）
			  -v ID    指定した声にする（IDは後述のVoices参照）
			  -s 1.0   スピードを指定する（0.5, 2, ...）
			  -V 0.0   ボリュームを指定する（-10, 10, ...）
			  -o PATH  出力先パスを指定する（test.wav）
			  -d PATH  辞書のパスを指定する
			  -S       再生しない。（-oを指定したときのみ）
		EOS
		cat <<-EOS
			Env:
			  OPENJTALK_VOICE_DIR  .htsvoiceがあるルートディレクトリパスをセットすること
			    "${OPENJTALK_VOICE_DIR}"
		EOS
		cat <<-EOS
			Voices: $(echo -e "$(GetVoicesWithoutBlacklist)" | wc -l)
		EOS
		cat <<-EOS
			  Green: $(echo -e "$(GetGreenlistVoices)" | wc -l)
			    $(echo "$(GetGreenlistVoices)" | sed -r 's/(.+)\/(.+)\.htsvoice/\2/g' | uniq | sort | tr '\n' ' ')
		EOS
		cat <<-EOS
			  Normal: $(echo -e "$(GetNormallistVoice)" | wc -l)
			    $(echo "$(GetNormallistVoice)" | sed -r 's/(.+)\/(.+)\.htsvoice/\2/g' | uniq | sort | tr '\n' ' ')
		EOS
		cat <<-EOS
			  Black: $(echo -e "$(GetBlacklistVoices)" | wc -l)  Error: Dictionary or HTS voice cannot be loaded.
			    $(echo "$(GetBlacklistVoices)" | sed -r 's/(.+)\/(.+)\.htsvoice/\2/g' | uniq | sort | tr '\n' ' ')
		EOS
		cat <<-EOS
			This:
			  "$this_path"
			Examples:
			  $this これを読み上げます
			  $this -r 声をランダムにします
			  $this -v type-beta 初音ミクです
			  $this -o /tmp/work/a.wav 音声ファイルに録音します
		EOS
	}
	local OPT_IS_RANDOM_VOICE=0
	local OPT_SELECTED_VOICE="$(GetDefaultVoice)"
	local OPT_SELECTED_DIC_PATH="$(GetDefaultDic)"
	local OPT_OUTPUT_FILE_PATH="/dev/stdout"
	local OPT_SPEED="1.0" # -r 1.0
	local OPT_VOLUME="0.0" # -g 0.0
	local OPT_IS_SILENT=0
	while getopts ':rRv:o:d:s:V:Sh' OPT; do
		case $OPT in
#		r) OPT_SELECTED_VOICE="$(GetRandomVoice)" ;;
		r) OPT_SELECTED_VOICE="$(echo -e "$(GetVoicesWithoutBlacklist)" | GetRandomVoice)" ;;
		R) OPT_SELECTED_VOICE="$(echo -e "$(GetGreenlistVoices)" | GetRandomVoice)" ;;
		v) OPT_SELECTED_VOICE="$(SearchVoice "$OPTARG")" ;;
		d) OPT_SELECTED_DIC_PATH="$OPTARG" ;;
		o) OPT_OUTPUT_FILE_PATH="$OPTARG" ;;
		s) OPT_SPEED="$OPTARG" ;;
		V) OPT_VOLUME="$OPTARG" ;;
		S) OPT_IS_SILENT=1 ;;
		h) Help; return;;
		:) echo  "[ERROR] 値が必要なオプションに値が指定されていません。"; Help; return;;   # 
		\?) echo "[ERROR] 未定義のオプションです。"; Help; return;;
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
		echo "open_jtalk -x \"$DIC\" -m \"$VOICE\" -ow \"$OUTPUT\" -r $OPT_SPEED -g $OPT_VOLUME"
	}
	AplayCmd() {
		local OUTPUT="$OPT_OUTPUT_FILE_PATH"
		[ "$OUTPUT" = '/dev/stdout' ] && { echo ' | aplay -q'; return; }
		[ 1 -eq $OPT_IS_SILENT ] && return;
		echo " ; aplay \"${OUTPUT}\"; "
	}
	local cmd="echo \"$MESSAGE\" | $(OpenJTalkCmd) $(AplayCmd)"
	echo "${cmd}"
	eval "${cmd}"
}
Run "$@"

