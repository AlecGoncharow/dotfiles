#!/usr/bin/python3

backlight_dir = '/sys/class/backlight/intel_backlight/'

brightness_file = 'brightness'
max_brightness_file = 'max_brightness'

brightness = int(open(backlight_dir + brightness_file).read())
max_brightness = int(open(backlight_dir + max_brightness_file).read())

ratio = (brightness / max_brightness)
percent = ratio * 100

round_percent = percent + 2.5
round_percent = round_percent - round_percent%5

print("{}%".format(round(round_percent)))
