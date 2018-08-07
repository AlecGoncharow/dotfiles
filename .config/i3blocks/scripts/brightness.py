#!/usr/bin/python3
# This script is for my i3blocks bar, its handles scrolling to change
# brightness of monitor

import subprocess
import re
import os

display = "eDP-1"

proc = subprocess.Popen("xrandr --verbose | grep Brightness", shell=True,
                        stdout=subprocess.PIPE)


res = proc.stdout.readline().strip()
res = str(res)

num = re.compile("\d\.\d+")
bri = num.findall(res)[0]

bri = round(float(bri)*100)

env = os.environ
if 'BLOCK_BUTTON' in env:
    button = env['BLOCK_BUTTON']
    if button is not '':
        button = int(button)
        if button is 4:
            new_bri = bri + 5
        elif button is 5:
            new_bri = bri - 5
        else:
            new_bri = bri

        if new_bri <= 100 and new_bri >= 10:
            bri = new_bri
            new_bri = new_bri/100
            subprocess.call(f"xrandr --output {display} --brightness {new_bri}",
                            shell=True)
            subprocess.call(f"echo {new_bri} > ~/.last_brightness", shell=True)

print(f"{bri}%")
