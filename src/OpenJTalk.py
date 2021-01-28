#/bin/env python3
#coding: utf-8

# sudo apt install open-jtalk-mecab-naist-jdic 
import os, os.path, glob, random
class OpenJTalk:
    __PATH_VOICE = '/usr/share/hts-voice/mei/mei_normal.htsvoice'
    def __init__(self, voices_dir=None):
        self.__path_voices = self.__get_default_path_voices(voices_dir)
        self.__path_voice = self.__get_default_path_voice()
        self.__path_dic = self.__get_default_path_dic()
        self.__path_output = self.__get_default_path_output()
        print(self.__path_voices)
    def __get_default_path_voices(self, voices_dir):
        default_path = os.path.expandvars(os.path.expanduser('$HOME/root/sys/env/tool/openjtalk/voice/'))
        for path in [voices_dir, default_path]:
            if path is not None and os.path.isdir(path): self.__path_voices = path
            else: continue
            if 0 < len(self.Voices): return path
        raise ValueError('*.htsvoiceファイルが見つかりませんでした。*.htsvoiceファイルがあるルートディレクトリパスを指定してください。コンストラクタの第１引数voices_dirで。')
    def __get_default_path_voice(self):
        path = '/usr/share/hts-voice/mei/mei_normal.htsvoice'
        if os.path.isfile(path): return path
        return self.RandomVoice
    def __get_default_path_dic(self):
        path = '/var/lib/mecab/dic/open-jtalk/naist-jdic'
        if os.path.isfile(path): return path
        return '/usr/local/dic'
    def __get_default_path_output(self):
        return '/dev/stdout'
    @property
    def VoiceRoot(self): return self.__path_voices
    @VoiceRoot.setter
    def VoiceRoot(self, value):
        if (os.path.isdir(value)):
            self.__path_voices = value
    @property
    def Voices(self):
        return glob.glob(os.path.join(self.__path_voices, '**/*.htsvoice'), recursive=True)
    @property
    def Voice(self): return self.__path_voice
    @Voice.setter
    def Voice(self, value):
        if value in self.__path_voices:
            self.__path_voice = value
    @property
    def RandomVoice(self):
        return random.choice(self.Voices)
    def talk(self, msg=None, voice=None, output=None):
        msg = 'テストです。' if msg is None else msg
        voice = self.Voice if voice is None else voice
        output = self.__path_output if output is None else output
        cmd = 'echo "' + msg + '" | open_jtalk -x "' + self.__path_dic + '" -ow "'+ output +'" -m "'+ voice +'" | aplay'
        os.system(cmd)


if __name__ == '__main__':
    talker = OpenJTalk()
    talker.talk()
    talker.talk('パイソンでOpenJTalkを使う')
    talker.talk('声をランダムに変える', talker.RandomVoice)
    print(talker.Voices)
    print(glob.glob(os.path.join(os.path.expandvars(os.path.expanduser('$HOME/root/sys/env/tool/openjtalk/voice/')), '/**/*.htsvoice')))
#    import os
#    os.system('echo -e "A\nB\nC" | head -n 2 | tail -n 1')
#    cmd = 'echo "テストです。" | open_jtalk -x /usr/local/dic -ow /dev/stdout -m /home/pi/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com/type-alpha.htsvoice | aplay'
#    os.system(cmd)
