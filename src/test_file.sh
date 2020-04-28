#!/bin/bash
# 全ボイスの音声ファイル作成
OpenJTalkWav() {
	name="$(echo "$(basename "$2")" | sed 's/\.[^\.]*$//')"
	echo "$1" | open_jtalk \
		-x /usr/local/dic \
		-m "$2" \
		-ow "./wav/$name.wav"
	ffmpeg -y -i "./wav/$name.wav" -vn -ar 44100 -ac 2 -acodec flac -f flac "./flac/$name.flac"
#	aplay "$name.flac"
}
StdOut() { echo '/dev/stdout'; }
WavFileName() {
	local name="$(basename "$1")"
	echo "${name%.}.wav"
}
AllVoiceTestWav() {
	local word="こんにちは。音声合成OpenJTalkを使ったテストです。喋るラズベリーパイをご堪能あれ。"
	local voices="$(find $HOME/root/sys/env/tool/openjtalk/voice/ -name *.htsvoice)"
	echo -e "$voices" | while read line; do
		OpenJTalkWav "$word" "$line"
	done
}
mkdir wav
mkdir flac
AllVoiceTestWav
#PlayFlac() {
#	local voices="$(find ./flac -name '*.flac')"
#	echo -e "$voices" | while read line; do
#		aplay "$line"
#	done
#}
#PlayFlac

