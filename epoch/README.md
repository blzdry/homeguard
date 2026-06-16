# Epoch 
### Little nerdy fact - this was the original name of Gentoo Linux, thought I needed to share that one :P

> (incomplete, will update at some point)

Here is a table list of the packages I installed to setup i3wm, sorted as the package name, is essential, and lastly if it's in [GURU](https://wiki.gentoo.org/wiki/Project:GURU).

| Packages             | Essential?          | in GURU?            | 
| ------------------   | ------------------- | ------------------- | 
| x11-base/xorg-server | yes                 | no                  
| x11-base/xorg-driver | yes                 | no
| media-fonts/noto     | recommended         | no
| media-fonts/fonts-meta | recommended       | no
| media-fonts/noto-cjk | recommended         | no
| media-fonts/corefonts | optional           | no
| x11-wm/i3            | totally             | no
| x11-wm/i3lock        | optional            | no
| x11-wm/i3status      | yes                 | no
| sys-power/acpi       | if using laptop     | no
| x11-terms/xfce4-terminal | can use other terminal | no
| dev-python/watchdog  | if using xob, yes   | no
| x11-misc/xob         | optional            | yes
| sys-fs/duf           | no                  | yes
| sys-power/brightnessctl | yes              | yes
| media-sound/pulseaudio-daemon | yes        | no
| media-sound/alsa-utils | yes               | no
| media-sound/alsa-tools | depends           | no

Regarding xob - ready-to-use brightness snippet:

```py
#!/usr/bin/env python3
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler, FileModifiedEvent
import sys
import time

brightness_file = '/sys/class/backlight/intel_backlight/brightness'
max_brightness_file ='/sys/class/backlight/intel_backlight/max_brightness'
with open(max_brightness_file, 'r') as f:
    maxvalue = int(f.read())

def notify(file_path):
    with open(file_path, 'r') as f: 
        value = int(int(f.read())/maxvalue*100)
        print(value)

class Handler(FileSystemEventHandler):

    def on_modified(self, event):
        if isinstance(event, FileModifiedEvent):
            notify(event.src_path)

handler = Handler()
observer = Observer()
observer.schedule(handler, path=brightness_file)
observer.start()
try:
    while True:
        sys.stdout.flush()
        time.sleep(1)
except KeyboardInterrupt:
    observer.stop()
observer.join()
```

I made slight changes since the interval of the bar was too slow, noticeably:

```py
try:
    while True:
        sys.stdout.flush()
        time.sleep(0.05)
except KeyboardInterrupt:
    observer.stop()
observer.join()
```

`time.sleep` was adjusted onto a lower timeframe - so when the combination for brightness was invoked, (e.g fn + fX) `xob` appears the same time you hit the keybind.

`flush=True`
In i3/config - autostart section:

`exec --no-startup-id ~/.local/bin/xob-brightness.py | xob -t 1500` sets `xob`'s timeout to 1500, so that the fade out of the bar isn't as abrupt as it might be.