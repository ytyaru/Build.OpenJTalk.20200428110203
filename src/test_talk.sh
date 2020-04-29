#!/bin/bash
FILES="$(find $HOME/root/sys/env/tool/openjtalk/voice/ -name *.htsvoice | uniq)"
echo "$FILES"
echo "$FILES" | wc -l

# 再生
echo 'こんにちは' | open_jtalk \
 -x /usr/local/dic \
 -m /home/pi/root/sys/env/tool/openjtalk/voice/hts_voice_nitech_jp_atr503_m001-1.05/nitech_jp_atr503_m001.htsvoice \
 -ow /dev/stdout \
 | aplay > /dev/null 2>&1

# ボイス変更
echo 'こんにちは' | open_jtalk \
 -x /usr/local/dic \
 -m /home/pi/root/sys/env/tool/openjtalk/voice/MMDAgent_Example-1.8/Voice/mei/mei_happy.htsvoice \
 -ow /dev/stdout \
 | aplay

echo 'こんにちは' | open_jtalk \
 -x /usr/local/dic \
 -m /home/pi/root/sys/env/tool/openjtalk/voice/akihiro0105/グリマルキン_1.0/グリマルキン_1.0.htsvoice \
 -ow /dev/stdout \
 | aplay

# 関数化
OpenJTalk() {
	echo "$1" | open_jtalk \
		-x /usr/local/dic \
		-m "$2" \
		-ow /dev/stdout \
		| aplay
}
AllVoiceTest() {
	local word="こんにちは。音声合成OpenJTalkを使ったテストです。喋るラズベリーパイをご堪能あれ。"
	local voices="$(find $HOME/root/sys/env/tool/openjtalk/voice/ -name *.htsvoice)"
	echo -e "$voices" | while read line; do
		OpenJTalk "$word" "$line"
	done
}
AllVoiceTest

