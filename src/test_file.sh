#!/bin/bash
VOICE_FILES="$(find $HOME/root/sys/env/tool/openjtalk/voice/ -name *.htsvoice)"
echo "$VOICE_FILES"
echo -e "$VOICE_FILES" | wc -l

# 全ボイスの音声ファイル作成
OpenJTalkWav() {
	name="$(echo "$(basename "$2")" | sed 's/\.[^\.]*$//')"
	echo "$1" | open_jtalk \
		-x /usr/local/dic \
		-m "$2" \
		-ow "./wav/$name.wav"
	error=$?
	[ $error -ne 0 ] && { echo "ERROR: $2"; }
}
AllVoiceTestWav() {
	local word="こんにちは。音声合成OpenJTalkを使ったテストです。喋るラズベリーパイをご堪能あれ。"
	local voices="$(find $HOME/root/sys/env/tool/openjtalk/voice/ -name *.htsvoice)"
	echo -e "$voices" | while read line; do
		OpenJTalkWav "$word" "$line"
	done
}
Wav2Flac() {
	echo -e "$VOICE_FILES" | while read line; do
		name="$(echo "$(basename "$line")" | sed 's/\.[^\.]*$//')"
		ffmpeg -y -i "./wav/$name.wav" -vn -ar 44100 -ac 2 -acodec flac -f flac "./flac/$name.flac"
	done
}
ToHtml() {
	voice_num='<h1>OpenJTalk 音響モデル</h1>''\n''<p>voice: '"$(echo -e "$VOICE_FILES" | wc -l)"'</p>'
	table="<table>\n"
	IFS=$'\n'
	for line in `echo -e "$VOICE_FILES"`; do
		name="$(echo "$(basename "$line")" | sed 's/\.[^\.]*$//')"
#		urlA=https://raw.githubusercontent.com/ytyaru/Build.OpenJTalk.20200428110203/master/docs
#		url_wav=$urlA/wav/$name.wav
#		url_flac=$urlA/flac/$name.flac
		urlB=https://github.com/ytyaru/Build.OpenJTalk.20200428110203/blob/master/docs
		url_wav=$urlB/wav/$name.wav?raw=true
		url_flac=$urlB/flac/$name.flac?raw=true
		tr="<tr><td>$name</td><td><audio controls><source src=\"$url_flac\" type=\"audio/flac\"><source src=\"$url_wav\" type=\"audio/wav\"></audio></td></tr>"
		table+="${tr}\n"
	done
	table+="</table>\n"
	thanks="<h1>Thanks</h1>\n<ul>\n"
	thanks+="<li><a href=\"http://hts-engine.sourceforge.net/\">HTS_Engine</a></li>\n"
	thanks+="<li><a href=\"http://open-jtalk.sp.nitech.ac.jp/\">OpenJTalk</a></li>\n"
	thanks+="<li><a href=\"https://jaist.dl.sourceforge.net/project/open-jtalk/HTS%20voice/hts_voice_nitech_jp_atr503_m001-1.05\">hts_voice_nitech_jp_atr503_m001-1.05</a></li>\n"
	thanks+="<li><a href=\"http://www.mmdagent.jp/\">MMD Agent</a></li>\n"
	thanks+="<li><a href=\"http://akihiro0105.web.fc2.com/Downloads/Downloads-htsvoice.html\">akihiro0105.web.fc2.com</a></li>\n"
	thanks+="<li><a href=\"https://github.com/icn-lab/htsvoice-tohoku-f01\">tohoku-f01</a></li>\n"
	thanks+="<li><a href=\"https://ragolun.exblog.jp/\">ragolun.exblog.jp</a></li>\n"
	thanks+="<li><a href=\"https://github.com/anoyetta/ACT.Hojoring/tree/master/source/ACT.TTSYukkuri/ACT.TTSYukkuri.Core/OpenJTalk/voice\">cube370</a></li>\n"
	thanks+="</ul>\n"
	error="<h1>Error</h1>\n<pre><code>Dictionary or HTS voice cannot be loaded.</code></pre>\n"
	error+="<ul>\n"
	error+="<li>cmu_us_arctic_slt.htsvoice</li>\n"
	error+="<li>H-09.htsvoice</li>\n"
	error+="<li>海賊まさver5.htsvoice</li>\n"
	error+="<li>雪音ルウ２.htsvoice</li>\n"
	error+="</ul>\n"
	html="<html>\n<body>${voice_num}\n${table}\n${error}\n${thanks}</body></html>"
	echo -e "$html" > index.html
}
ToMarkdown() {
	local voice_num='voice: '"$(echo -e "$VOICE_FILES" | wc -l)""\n\n"
	local table="音響モデル|再生\n----------|----\n"
	IFS=$'\n'
	for line in `echo -e "$VOICE_FILES"`; do
		local name="$(echo "$(basename "$line")" | sed 's/\.[^\.]*$//')"
		urlB=https://github.com/ytyaru/Build.OpenJTalk.20200428110203/blob/master/docs
		url_wav=$urlB/wav/$name.wav?raw=true
		url_flac=$urlB/flac/$name.flac?raw=true
		local tr="$name|<audio controls><source src=\"$url_flac\" type=\"audio/flac\"><source src=\"$url_wav\" type=\"audio/wav\"></audio>"
		table+="${tr}\n"
	done
	table+="\n"
	thanks="\n"
	thanks+="* [HTS_Engine](http://hts-engine.sourceforge.net/)\n"
	thanks+="* [OpenJTalk](http://open-jtalk.sp.nitech.ac.jp/)\n"
	thanks+="* [hts_voice_nitech_jp_atr503_m001-1.05](https://jaist.dl.sourceforge.net/project/open-jtalk/HTS%20voice/hts_voice_nitech_jp_atr503_m001-1.05)\n"
	thanks+="* [MMD Agent](http://www.mmdagent.jp/)\n"
	thanks+="* [akihiro0105.web.fc2.com](http://akihiro0105.web.fc2.com/Downloads/Downloads-htsvoice.html)\n"
	thanks+="* [tohoku-f01](https://github.com/icn-lab/htsvoice-tohoku-f01)\n"
	thanks+="* [ragolun.exblog.jp](https://ragolun.exblog.jp/)\n"
	thanks+="* [cube370](https://github.com/anoyetta/ACT.Hojoring/tree/master/source/ACT.TTSYukkuri/ACT.TTSYukkuri.Core/OpenJTalk/voice)\n"
	echo -e "$voice_num$table$thanks" > markdown.md
}
mkdir wav
mkdir flac
#AllVoiceTestWav
#Wav2Flac
ToHtml
ToMarkdown
#PlayFlac() {
#	local voices="$(find ./flac -name '*.flac')"
#	echo -e "$voices" | while read line; do
#		aplay "$line"
#	done
#}
#PlayFlac

