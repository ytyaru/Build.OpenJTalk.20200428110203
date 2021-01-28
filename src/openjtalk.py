#/bin/env python3
#coding: utf-8

# sudo apt install open-jtalk-mecab-naist-jdic 

import subprocess
from datetime import datetime

def jtalk(t):
    open_jtalk=['open_jtalk']
    mech=['-x','/var/lib/mecab/dic/open-jtalk/naist-jdic']
#    mech=['-x','/usr/local/dic']
#    htsvoice=['-m','/usr/share/hts-voice/mei/mei_normal.htsvoice']
    htsvoice=['-m','/home/pi/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com/type-alpha.htsvoice']

    speed=['-r','1.0']
#    outwav=['-ow','open_jtalk.wav']
    outwav=['-ow','/dev/stdout']
    cmd=open_jtalk+mech+htsvoice+speed+outwav
    print(cmd)
    c = subprocess.Popen(cmd,stdin=subprocess.PIPE)
    c.stdin.write(t.encode())
    c.stdin.close()
    c.wait()
#    aplay = ['aplay','-q','open_jtalk.wav']
    aplay = ['aplay']
    wr = subprocess.Popen(aplay)

def say_datetime():
    d = datetime.now()
    text = '%s月%s日、%s時%s分%s秒' % (d.month, d.day, d.hour, d.minute, d.second)
    jtalk(text)

if __name__ == '__main__':
#    say_datetime()
    import os
    os.system('echo -e "A\nB\nC" | head -n 2 | tail -n 1')
    cmd = 'echo "テストです。" | open_jtalk -x /usr/local/dic -ow /dev/stdout -m /home/pi/root/sys/env/tool/openjtalk/voice/cube370.wiki.fc2.com/type-alpha.htsvoice | aplay'
    os.system(cmd)
