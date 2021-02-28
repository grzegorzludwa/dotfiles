# Commands:
sudo turbostat -i 0.1 | cut -f1-4,32,33,48-50


## Deps:
```
apt install feh fonts-font-awesome rofi pulseaudio-utils xbacklight alsa-tools clipit gcc git terminator locate pcmanfm acpi libnotify-bin
```

### xbacklight doesn't work
```
git clone https://github.com/szekelyszilv/ybacklight.git
cd ybacklight/src
gcc ybacklight.c -o /usr/bin/ybacklight
```

### Shutter
```
sudo add-apt-repository -y -u ppa:linuxuprising/shutter
apt install shutter
```

## Paths

~/.config/i3
~/.config/i3blocks

## i3 tutorial:
https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/

## Blocklets examples
https://vivien.github.io/i3blocks/blocklets
