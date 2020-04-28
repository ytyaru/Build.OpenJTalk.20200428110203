[ja](./README.ja.md)

# Build.OpenJTalk

Build OpenJTalk.

# DEMO

* https://ytyaru.github.io/Build.OpenJTalk.20200428110203/

# Requirement

* <time datetime="2020-04-28T11:01:56+0900">2020-04-28</time>
* [Raspbierry Pi](https://ja.wikipedia.org/wiki/Raspberry_Pi) 4 Model B Rev 1.2
* [Raspbian](https://ja.wikipedia.org/wiki/Raspbian) buster 10.0 2019-09-26 <small>[setup](http://ytyaru.hatenablog.com/entry/2019/12/25/222222)</small>
* bash 5.0.3(1)-release
* OpenJTalk

```sh
$ uname -a
Linux raspberrypi 4.19.97-v7l+ #1294 SMP Thu Jan 30 13:21:14 GMT 2020 armv7l GNU/Linux
```

# Usage

```sh
git clone https://github.com/ytyaru/Build.OpenJTalk.20200428110203
cd Build.OpenJTalk.20200428110203/src
./run.sh
./test_talk.sh
./test_file.sh
```

# Author

ytyaru

* [![github](http://www.google.com/s2/favicons?domain=github.com)](https://github.com/ytyaru "github")
* [![hatena](http://www.google.com/s2/favicons?domain=www.hatena.ne.jp)](http://ytyaru.hatenablog.com/ytyaru "hatena")
* [![mastodon](http://www.google.com/s2/favicons?domain=mstdn.jp)](https://mstdn.jp/web/accounts/233143 "mastdon")

# License

This software is CC0 licensed.

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.en)

The following was used for the engine and acoustic data. Thanks.

* [HTS_Engine](http://hts-engine.sourceforge.net/)
* [OpenJTalk](http://open-jtalk.sp.nitech.ac.jp/)
    * [hts_voice_nitech_jp_atr503_m001-1.05](https://jaist.dl.sourceforge.net/project/open-jtalk/HTS%20voice/hts_voice_nitech_jp_atr503_m001-1.05)
* [MMD Agent](http://www.mmdagent.jp/)
* [akihiro0105.web.fc2.com](http://akihiro0105.web.fc2.com/Downloads/Downloads-htsvoice.html)

