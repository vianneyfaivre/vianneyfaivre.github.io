---
layout: post
title: "Ubuntu - How to enable touchpad vertical & horizontal scrolling"
categories: [tech]
---

Sometimes my pc freezes and when rebooting I can't scroll via my touchpad anymore.

When going to the mouse settings it's not showing the touchpad specific config as well.

That can be fixed by reconfiguring the touchpad input via its config file.

- `sudo gedit /usr/share/X11/xorg.conf.d/40-libinput.conf`
- find the `Touchpad` section
- Add:
   - `Option "VerticalScrolling" "True"`
   - `Option "HorizontalScrolling" "True"`

You should end up with something like:

```
Section "InputClass"
    Identifier "libinput touchpad catchall"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Driver "libinput"
    Option "HorizontalScrolling" "True"
    Option "VerticalScrolling" "True"
EndSection
```

(This bugfix assumes you have libinput-tools installed)

Tested on Ubuntu 20.04 LTS