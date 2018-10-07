#!/usr/bin/python3

import subprocess

backlight_dir = '/sys/class/backlight/intel_backlight/'

brightness_file = 'brightness'
max_brightness_file = 'max_brightness'

brightness = int(open(backlight_dir + brightness_file).read())
max_brightness = int(open(backlight_dir + max_brightness_file).read())
ratio = (brightness / max_brightness)
brightness = ratio * 100

if brightness > 6:
    subprocess.call("xbacklight -set {}".format(brightness - 5), shell=True)
