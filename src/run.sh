#!/bin/bash

# HTS_engine
cd "$(dirname "${BASH_SOURCE:-$0}")"
wget https://jaist.dl.sourceforge.net/project/hts-engine/hts_engine%20API/hts_engine_API-1.10/hts_engine_API-1.10.tar.gz
wget https://master.dl.sourceforge.net/project/hts-engine/hts_engine%20API/hts_engine_API-1.10/hts_engine_API_readme-1.10.txt
wget https://jaist.dl.sourceforge.net/project/hts-engine/hts_engine%20API/hts_engine_API-1.10/hts_engine_API_reference-1.10.pdf
tar -zxvf hts_engine_API-1.10.tar.gz
cd hts_engine_API-1.10
./configure
make
sudo make install
cd ..

# OpenJTalk
wget https://jaist.dl.sourceforge.net/project/open-jtalk/Open%20JTalk/open_jtalk-1.11/open_jtalk-1.11.tar.gz
wget https://excellmedia.dl.sourceforge.net/project/open-jtalk/Open%20JTalk/open_jtalk-1.11/open_jtalk_readme-1.11.txt
tar -zxvf open_jtalk-1.11.tar.gz
cd open_jtalk-1.11
./configure --with-hts-engine-header-path=/usr/local/include --with-hts-engine-library-path=/usr/local/lib --with-charset=UTF-8
make
sudo make install
which open_jtalk
cd ..

# Voices
wget https://jaist.dl.sourceforge.net/project/open-jtalk/HTS%20voice/hts_voice_nitech_jp_atr503_m001-1.05/hts_voice_nitech_jp_atr503_m001-1.05.tar.gz
wget https://master.dl.sourceforge.net/project/open-jtalk/HTS%20voice/hts_voice_nitech_jp_atr503_m001-1.05/hts_voice_nitech_jp_atr503_m001_readme-1.05.txt
tar -zxvf hts_voice_nitech_jp_atr503_m001-1.05.tar.gz
find hts_voice_nitech_jp_atr503_m001-1.05/ -name *.htsvoice

wget https://jaist.dl.sourceforge.net/project/mmdagent/MMDAgent_Example/MMDAgent_Example-1.8/MMDAgent_Example-1.8.zip
wget https://jaist.dl.sourceforge.net/project/mmdagent/MMDAgent_Example/MMDAgent_Example-1.8/MMDAgent_Example-1.8.mmda
wget https://svwh.dl.sourceforge.net/project/mmdagent/MMDAgent_Example/MMDAgent_Example-1.8/MMDAgent_Example_readme-1.8.txt
unzip MMDAgent_Example-1.8.zip
find MMDAgent_Example-1.8/ -name *.htsvoice

wget https://www.dropbox.com/s/lhjwmh6tosmv7tm/%E6%83%B3%E9%9F%B3%E3%81%84%E3%81%8F%E3%82%8B_1.0.zip?dl=1
wget https://www.dropbox.com/s/5yrh8j4gaqmbn89/%E6%83%B3%E9%9F%B3%E3%81%84%E3%81%8F%E3%81%A8_1.0.zip?dl=1
wget https://www.dropbox.com/s/x1f7bldwjrmzton/%E4%BA%AC%E6%AD%8C%E3%82%AB%E3%82%AA%E3%83%AB_1.0.zip?dl=1
wget https://www.dropbox.com/s/qy24nlfwqhbtzvd/%E6%B2%99%E9%9F%B3%E3%81%BB%E3%82%80_1.0.zip?dl=1
wget https://www.dropbox.com/s/vsrsxx0h368ru2m/20%E4%BB%A3%E7%94%B7%E6%80%A701_1.0.zip?dl=1
wget https://www.dropbox.com/s/rb4t4x1p8x7182r/%E3%81%AA%E3%81%AA%E3%81%84%E3%82%8D%E3%83%8B%E3%82%B8_1.0.zip?dl=1
wget https://www.dropbox.com/s/aibhqzakxv6a7iw/%E9%81%A0%E8%97%A4%E6%84%9B_1.0.zip?dl=1
wget https://www.dropbox.com/s/0afvd64suh51e9g/%E9%81%8A%E9%9F%B3%E4%B8%80%E8%8E%89_1.0.zip?dl=1
wget https://www.dropbox.com/s/letu9qbtspuqa68/%E3%82%B9%E3%83%A9%E3%83%B3%E3%82%AD_1.0.zip?dl=1
wget https://www.dropbox.com/s/1q7ayg05bv8c95x/%E8%92%BC%E6%AD%8C%E3%83%8D%E3%83%AD_1.0.zip?dl=1
wget https://www.dropbox.com/s/fbr6wcaoaj6gfs5/%E7%B7%8B%E6%83%BA_1.0.zip?dl=1
wget https://www.dropbox.com/s/cqfuwsns0kveo75/%E5%A4%A9%E6%9C%88%E3%82%8A%E3%82%88%E3%82%93_1.0.zip?dl=1
wget https://www.dropbox.com/s/o6vd5d43spnqiqw/%E5%8F%A5%E9%9F%B3%E3%82%B3%E3%83%8E%E3%80%82_1.0.zip?dl=1
wget https://www.dropbox.com/s/1oqbtc4mqo76r7d/%E5%94%B1%E5%9C%B0%E3%83%A8%E3%82%A8_1.0.zip?dl=1
wget https://www.dropbox.com/s/ueivoklj4w5alec/%E3%82%AB%E3%83%9E%E5%A3%B0%E3%82%AE%E3%83%AB%E5%AD%90_1.0.zip?dl=1
wget https://www.dropbox.com/s/dhhxe5ax8gq9wf7/%E3%83%AF%E3%82%BF%E3%82%B7_1.0.zip?dl=1
wget https://www.dropbox.com/s/0a9sdvdc97y8cjy/%E9%A3%B4%E9%9F%B3%E3%82%8F%E3%82%81%E3%81%82_1.0.zip?dl=1
wget https://www.dropbox.com/s/wzg3elfzpj3r1nn/%E8%83%BD%E6%B0%91%E9%9F%B3%E3%82%BD%E3%82%A6_1.0.zip?dl=1
wget https://www.dropbox.com/s/565p1ezszoukfy7/%E7%A9%BA%E5%94%84%E3%82%AB%E3%83%8A%E3%82%BF_1.0.zip?dl=1
wget https://www.dropbox.com/s/divfct7u7deilpa/%E6%88%AF%E6%AD%8C%E3%83%A9%E3%82%AB%E3%83%B3_1.0.zip?dl=1
wget https://www.dropbox.com/s/biaaofnmd9idit1/%E8%AA%A0%E9%9F%B3%E3%82%B3%E3%83%88_1.0.zip?dl=1
wget https://www.dropbox.com/s/9ecqymm6jccgldk/%E7%99%BD%E7%8B%90%E8%88%9E_1.0.zip?dl=1
wget https://www.dropbox.com/s/ji63elmcjk60esf/%E6%9D%BE%E5%B0%BEP_1.0.zip?dl=1
wget https://www.dropbox.com/s/r9upv0z7wa8psb6/%E7%91%9E%E6%AD%8C%E3%83%9F%E3%82%BA%E3%82%AD_Talk_1.0.zip?dl=1
wget https://www.dropbox.com/s/9ocd1o0a8adabuy/%E8%96%AA%E5%AE%AE%E9%A2%A8%E5%AD%A3_1.0.zip?dl=1
wget https://www.dropbox.com/s/4bawa2afl4hqzu4/%E5%92%8C%E9%9F%B3%E3%82%B7%E3%83%90_1.0.zip?dl=1
wget https://www.dropbox.com/s/sny6b16eeeayee3/%E3%82%B0%E3%83%AA%E3%83%9E%E3%83%AB%E3%82%AD%E3%83%B3_1.0.zip?dl=1
wget https://www.dropbox.com/s/7ut7pfmjoaqdaj3/%E9%97%87%E5%A4%9C%20%E6%A1%9C_1.0.zip?dl=1
wget https://www.dropbox.com/s/vf4je8a4y2v1znz/%E6%9C%88%E9%9F%B3%E3%83%A9%E3%83%9F_1.0.zip?dl=1
wget https://www.dropbox.com/s/t96gik07qrn2oes/%E6%A1%83%E9%9F%B3%E3%83%A2%E3%83%A2_1.0.zip?dl=1
wget https://www.dropbox.com/s/elt5kbgbzeaksls/%E7%8D%A3%E9%9F%B3%E3%83%AD%E3%82%A6_1.0.zip?dl=1
sudo apt -y install unar
unar 獣音ロウ_1.0.zip
unar 桃音モモ_1.0.zip
unar 月音ラミ_1.0.zip
unar "闇夜 桜_1.0.zip"
unar グリマルキン_1.0.zip
unar 薪宮風季_1.0.zip
unar 和音シバ_1.0.zip
unar 瑞歌ミズキ_Talk_1.0.zip
unar 松尾P_1.0.zip
unar 誠音コト_1.0.zip
unar 白狐舞_1.0.zip
unar 戯歌ラカン_1.0.zip
unar 空唄カナタ_1.0.zip
unar 飴音わめあ_1.0.zip
unar 能民音ソウ_1.0.zip
unar ワタシ_1.0.zip
unar カマ声ギル子_1.0.zip
unar 句音コノ。_1.0.zip
unar 唱地ヨエ_1.0.zip
unar 天月りよん_1.0.zip
unar 緋惺_1.0.zip
unar スランキ_1.0.zip
unar 蒼歌ネロ_1.0.zip
unar 遊音一莉_1.0.zip
unar 遠藤愛_1.0.zip
unar 20代男性01_1.0.zip
unar なないろニジ_1.0.zip
unar 沙音ほむ_1.0.zip
unar 京歌カオル_1.0.zip
unar 想音いくと_1.0.zip
unar 想音いくる_1.0.zip

sudo mkdir -p $HOME/root/sys/env/tool/openjtalk/voice/
cp ./hts_voice_nitech_jp_atr503_m001-1.05/ $HOME/root/sys/env/tool/openjtalk/voice/
cp ./MMDAgent_Example-1.8/ $HOME/root/sys/env/tool/openjtalk/voice/
cp 獣音ロウ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 桃音モモ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 月音ラミ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp "闇夜 桜_1.0" $HOME/root/sys/env/tool/openjtalk/voice/
cp グリマルキン_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 薪宮風季_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 和音シバ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 瑞歌ミズキ_Talk_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 松尾P_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 誠音コト_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 白狐舞_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 戯歌ラカン_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 空唄カナタ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 飴音わめあ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 能民音ソウ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp ワタシ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp カマ声ギル子_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 句音コノ。_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 唱地ヨエ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 天月りよん_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 緋惺_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp スランキ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 蒼歌ネロ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 遊音一莉_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 遠藤愛_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 20代男性01_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp なないろニジ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 沙音ほむ_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 京歌カオル_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 想音いくと_1.0 $HOME/root/sys/env/tool/openjtalk/voice/
cp 想音いくる_1.0 $HOME/root/sys/env/tool/openjtalk/voice/

find $HOME/root/sys/env/tool/openjtalk/voice/ -name *.htsvoice

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

