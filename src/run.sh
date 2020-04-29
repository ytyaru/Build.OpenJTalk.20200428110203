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

# tohoku-f01
git clone https://github.com/icn-lab/htsvoice-tohoku-f01
cp -r htsvoice-tohoku-f01 $HOME/root/sys/env/tool/openjtalk/voice/

# cube370
mkdir -p $HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com
wget -O type-A.htsvoice https://github.com/anoyetta/ACT.Hojoring/blob/master/source/ACT.TTSYukkuri/ACT.TTSYukkuri.Core/OpenJTalk/voice/type-A.htsvoice?raw=true
wget -O type-B.htsvoice  https://github.com/anoyetta/ACT.Hojoring/blob/master/source/ACT.TTSYukkuri/ACT.TTSYukkuri.Core/OpenJTalk/voice/type-B.htsvoice?raw=true
wget -O type-G.htsvoice  https://github.com/anoyetta/ACT.Hojoring/blob/master/source/ACT.TTSYukkuri/ACT.TTSYukkuri.Core/OpenJTalk/voice/type-G.htsvoice?raw=true
wget -O type-T.htsvoice  https://github.com/anoyetta/ACT.Hojoring/blob/master/source/ACT.TTSYukkuri/ACT.TTSYukkuri.Core/OpenJTalk/voice/type-T.htsvoice?raw=true
wget -O type-alpha.htsvoice  https://github.com/anoyetta/ACT.Hojoring/blob/master/source/ACT.TTSYukkuri/ACT.TTSYukkuri.Core/OpenJTalk/voice/type-alpha.htsvoice?raw=true
wget -O type-beta.htsvoice  https://github.com/anoyetta/ACT.Hojoring/blob/master/source/ACT.TTSYukkuri/ACT.TTSYukkuri.Core/OpenJTalk/voice/type-beta.htsvoice?raw=true
cp type-A.htsvoice $HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com
cp type-B.htsvoice $HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com
cp type-G.htsvoice $HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com
cp type-T.htsvoice $HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com
cp type-alpha.htsvoice $HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com
cp type-beta.htsvoice $HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com

# http://cube370.wiki.fc2.com/wiki/%E8%87%AA%E4%BD%9C%E9%9F%B3%E9%9F%BF%E3%83%A2%E3%83%87%E3%83%AB
#wget https://box-bucket007.east.edge.storage-yahoobox.jp/7c6f5602-328c-4ef3-85a7-b7ed32d407da?response-content-disposition=attachment%3B%20filename%2A%3DUTF-8%27%27Voice%2520TYPE-%25CE%25B1.zip&response-content-type=application%2Fx-zip-compressed&AWSAccessKeyId=AKIMYIO3UN0W0AJP2HG&Expires=1588114106&Signature=saUmBOOlKOZngjqIDXlA6m9zbTQ%3D
#wget https://box-bucket007.east.edge.storage-yahoobox.jp/bce89f6a-1d51-4b57-ac6c-a7a9b5f6f5da?response-content-disposition=attachment%3B%20filename%2A%3DUTF-8%27%27Voice%2520TYPE-%25CE%25B2.zip&response-content-type=application%2Fx-zip-compressed&AWSAccessKeyId=AKIMYIO3UN0W0AJP2HG&Expires=1588114104&Signature=mdf6lj1DpO8t6mjLN7UMQK5fpcM%3D
#wget https://box-bucket007.east.edge.storage-yahoobox.jp/692101ad-34bd-404d-8e75-7752b2e13fc1?response-content-disposition=attachment%3B%20filename%2A%3DUTF-8%27%27ver1.zip&response-content-type=application%2Fx-zip-compressed&AWSAccessKeyId=AKIMYIO3UN0W0AJP2HG&Expires=1588114103&Signature=JJi6GLFHIAzVwp5vLY8E3YrbMQI%3D
#wget https://box-bucket007.east.edge.storage-yahoobox.jp/75a72995-8f1e-4e38-a508-f9c9caf794e7?response-content-disposition=attachment%3B%20filename%2A%3DUTF-8%27%27Voice%2520TYPE-%25CE%25B4%2520ver1.zip&response-content-type=application%2Fx-zip-compressed&AWSAccessKeyId=AKIMYIO3UN0W0AJP2HG&Expires=1588114101&Signature=%2BV0JN2o%2FUQXhgdrzqTvtMTtyeH0%3D
#unar "Voice TYPE-α.zip"
#unar "Voice TYPE-β.zip"
#unar "ver1.zip"
#unar "Voice TYPE-δ ver1.zip"
#mkdir -p "$HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com"
#cp -r "Voice TYPE-α" "$HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com"
#cp -r "Voice TYPE-β" "$HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com"
#cp -r "ver1" "$HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com"
#cp -r "Voice TYPE-δ ver1" "$HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com"
#cp -r "Voice TYPE-ƒÀ" "$HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com"
#cp -r "Voice TYPE-ƒ¿" "$HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com"
#cp -r "ver1" "$HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com"
#cp -r "Voice TYPE-ƒÂ ver1" "$HOME/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com"

# https://ragolun.exblog.jp/
wget https://ucd7000c47d3857fa1d7cd96d1c8.dl.dropboxusercontent.com/cd/0/get/A2sS4NdNNo5vLYT0sq7f1h5-88v8VBiLaZrcsByr_NQA6lLT_EAwUPHTn4aZOtt7o5TOPu2tFJ67PW0pe7cZwRHqQIBd2UPqxL1fNno3YBrlWA/file?_download_id=3410527103088319710015116337900931438871611135285688317362924928&_notify_domain=www.dropbox.com&dl=1
wget https://ucedfc8977c056a87ace48ab95b2.dl.dropboxusercontent.com/cd/0/get/A2voWgw1ONhGVmO3BWMW0DdT4l8hK81-hbvYL0YW2RnVMOeFzF8XE2EMmVFLnK8BTQEwD_CXfP5R9cZqVL3ZbCJH8h8XNV3pMfvKZry6MINAPg/file?_download_id=05131657441344473806040899488788764487557412455665181338712181744&_notify_domain=www.dropbox.com&dl=1
wget https://uc79ba190a525edd72abe49856ac.dl.dropboxusercontent.com/cd/0/get/A2vIE0akIuEYub5ds-KvlaaJy8H_0ffoOnOdcypJemA9dCSJCy9hnJwwDcgFEhevw_WKKcl2LwjZXTP-4MCRGj7OuhCHMrLSNWfzU4mtjbcBjw/file?_download_id=03870614259431160865582171696519558933896251059717663473211456457&_notify_domain=www.dropbox.com&dl=1
wget https://uc75cd6068bd18b4d4dafcaae24a.dl.dropboxusercontent.com/cd/0/get/A2tfdNKUlUHFgeWC2LfQlniqtOYhi_IQ1cyoAoEnal8Ifzw8GGOVPKkDXTalBWT7ippzFQm_OK9p0omlAk4cMySRxMNqaNIxE__CiHhCb3xlqg/file?_download_id=56571496591244167589468114893205491846345105682266761199323038847&_notify_domain=www.dropbox.com&dl=1
wget https://uc35133cae739fae5a600e07539d.dl.dropboxusercontent.com/cd/0/get/A2s4NawA3_J_aWkvomyuekgwvlpnM3R8g6xLpPoiXLPNCdqwaFCNoNP6QGF3iT-ECeZR8B9rUjgspvSs4b1iXqaV-CeZhH8B6wKlDGa2mP7N7w/file?_download_id=28610037926230472375026846208954997599070229142737243830725204&_notify_domain=www.dropbox.com&dl=1
wget https://ucb7f850a7691f7859373687ae3e.dl.dropboxusercontent.com/cd/0/get/A2vlJdfCPWZjQScESYSND3ZZCFOhNL6i48blbhkx0vx6CQjkZ1nPXcZ1NiGqn-iiodowEAvAnzTa_RphDllNUOQLj9A07x_RYpg618rlDi6w5g/file?_download_id=03889425044652528770800818827164287960042690033068561800715119889&_notify_domain=www.dropbox.com&dl=1
wget https://ucccff8b053a8814a51153a8a96e.dl.dropboxusercontent.com/cd/0/get/A2uRaM0bCJcNzd1QMGSpLvsyq57ljBTEnZqYdBLsM-JOEaLzxIS_vEpN1KzFQap4_-AFtEOZgcJsh1LZzutd6lhPm_QFZCZsCzpI9qO6q18w9Q/file?_download_id=567051691634231983403125989053993156330680433852615713965528657&_notify_domain=www.dropbox.com&dl=1
wget https://uc44f46cc80e6b5c8796ec18f216.dl.dropboxusercontent.com/cd/0/get/A2sZA2UxZN25pXCr4Xs8S-OA7gkh4QYoGJP21Jm92QnUsDpi6YAl3L9RTZLnu091EAuu0PxLKw_z5qR4pf1W3A_7q7RuWuLM1mHypHyN17pZ7g/file?_download_id=6009787151016297709266907366839089919721485975279344826030530864&_notify_domain=www.dropbox.com&dl=1
wget https://uccd282f1671c6f585493e97388f.dl.dropboxusercontent.com/cd/0/get/A2sKjNDVhchAuqrpiiu8qLtozVB1YmW7sBgkQOpeY39XCPpb4Ae08t-jITanHB7YiXWFUT4YveKLqKw8PSqMpS2MzyYHet1IRKMSirS0tBlcyw/file?_download_id=03410818572220076939119380585380160441486650212727872428462583547&_notify_domain=www.dropbox.com&dl=1
wget https://uc9d92a0b36894c0c18ca96b5b4e.dl.dropboxusercontent.com/cd/0/get/A2uNQoRwMXWrEb2Mg2zJzmKskbfCoqm3GNugbovSN-RW0dYtHLeRB_PXoEozBxkWq6ll5yQccfV2LhF5hYvlDc5dHNxlQj0lKDerdWgfsjwTYQ/file?_download_id=291719150213061604642654973160964562406061522557658028369367348309&_notify_domain=www.dropbox.com&dl=1
wget https://ucd872e497bd99efd91896811e20.dl.dropboxusercontent.com/cd/0/get/A2u15VymkI0gx-G6-RC4dJiIFY8Q20cd_MDKQFisbdxD_HLqwmvCweLsmyIfQHWBJdSzP9oFtre_EsSjMenTTojExDxq11L6g8dbeNt1D1YH_w/file?_download_id=489376607961263148341933427766111184105936400994266763785293068814&_notify_domain=www.dropbox.com&dl=1
wget https://ucf36e3a3d185ff8696d6d81c417.dl.dropboxusercontent.com/cd/0/get/A2ur9U0id4kf-oJBvABsAPXK-4NMwGsooWz2Z7pcLA0LtPYl2V1Kmgw3zIFiR091rR5sEwfR7N7p5cY0uOjFAA8UfWCG82CAWf1_D8NNAMu-AA/file?_download_id=32148443956563409440245959527105383952278724968737832767604352171&_notify_domain=www.dropbox.com&dl=1
wget https://ucaef86c7ed18eb4dffe5169f9fe.dl.dropboxusercontent.com/cd/0/get/A2tuLY63mxv53in4PqsyNMez6d9qhesZ7Z6DiT4deS_q14jCFWecy8_D3IDPd8O2ds7lKoqlxYjzJEoFaQSriJmlkDRdlbP61tx2DV6minj_pw/file?_download_id=8282169088738636036553044907608845188649694901779864894778001014&_notify_domain=www.dropbox.com&dl=1
wget https://uc84e202204c7af61f524ea7c73b.dl.dropboxusercontent.com/cd/0/get/A2vUY3Qz_GGjOa97HOSGbZp023ib0luIKX1qC-ftbEQGuyfGi1y6YvksjcoTpMUQEaiwWIQECyrfJYGOIRIoLlDOVxHXGZXjPapzQIPZius8gg/file?_download_id=694974570880211371465188717720384480962109170869641430219183317685&_notify_domain=www.dropbox.com&dl=1
wget https://uc97ddd948bc170e1bee4da8c062.dl.dropboxusercontent.com/cd/0/get/A2vy6XOc4eZObZdeC8ZdLLYckzwfe37v54BDi5RKmZLYvO-ZM8kmuFABi5y6-YPwzRJFZ-sLsLHdo2vVD-9TRoU0nw6T3mmAV2LIJ4xoE2V6gA/file?_download_id=300679820665335835802294979466571292838999316948235548047202052344&_notify_domain=www.dropbox.com&dl=1
wget https://uc133b0c5b0afa3a7dc751a35ad5.dl.dropboxusercontent.com/cd/0/get/A2tDj7Uo8QfsNVo-uNW4BWlQcu4S7RiViz6hiIjscCuoznS_AICGrGdWnWRqTyy4y3nG0gw1hYb64HH5MdUzjSIrw3wfW8_uGZEX4sY8M7CXMg/file?_download_id=78136780814183163794923656964863735291730774278873032957220015982225&_notify_domain=www.dropbox.com&dl=1
wget https://uc51e46a56cf29189bcec4fa0798.dl.dropboxusercontent.com/cd/0/get/A2sEE-aDMlwWUF0F7mMMNim0_Dv146JBsdZqQIjc4P2I4VR0154VNCqOCgQZiAliZL-DfHz-IM2LovSOBNQOzPnPDmZvFMEsBreOXA4vzPRatQ/file?_download_id=4859786877567968762861532159180841667114450392679422426756618491095&_notify_domain=www.dropbox.com&dl=1
wget https://ucc2bff5b84e44e5a93cb627a792.dl.dropboxusercontent.com/cd/0/get/A2sPovHXgPSasqClFgcjE7z5RAEvt44d86Q7kIo1USe84iITy5XBuSUdQnWuuiLWJSAN8PVkcLyhRp1IwkSgsMzlP0zWVuZtNOJk1atYBK7w_w/file?_download_id=3147300832519897424269870604793657311852961935429455078896856377&_notify_domain=www.dropbox.com&dl=1
mkdir -p "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "ぴよちゃんぼいす（.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "雪音ルウ２.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "雪音ルウ.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "L.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "風音桜凪.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "M.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "R.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "j2.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "J.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "ひめる３.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "ひめる.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "H-09.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "H-08.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "H-02.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "H-01.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "海賊まさver2.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "海賊まさver5.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"
cp "海賊まさver4.htsvoice" "$HOME/root/sys/env/tool/openjtalk/voice/ragolun.exblog.jp"

find $HOME/root/sys/env/tool/openjtalk/voice/ -name *.htsvoice
find $HOME/root/sys/env/tool/openjtalk/voice/ -name *.htsvoice | wc -l 

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

