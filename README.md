# dotfiles

You can find here all my important config files.
Small help below.

## Commands

``` bash
sudo turbostat -i 0.1 | cut -f1-4,32,33,48-50
```

## Deps

``` bash
apt install feh fonts-font-awesome rofi pulseaudio-utils alsa-tools clipit gcc git terminator locate pcmanfm acpi libnotify-bin blueman redshift numlockx
```

### install ybacklight (alternative of xbacklight)

``` bash
git clone https://github.com/szekelyszilv/ybacklight.git
cd ybacklight/src
gcc ybacklight.c -o /usr/bin/ybacklight
```

#### ybacklight desn't have permissions to change brightness

There are to options:

1. Enable passwordless sudo for ybacklight.

``` bash
echo "grzegorz ALL=NOPASSWD: /usr/bin/ybacklight" > /etc/sudoers.d/ybacklight
```

Then add sudo in i3/config and i3blocks/blocklets/brightness to ybacklight command.
2. As a vendor use your device (eg. `acpi_video0` or `intel_backlight`).

``` bash
cat /etc/udev/rules.d/backlight.rules
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="<vendor>", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="<vendor>", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"
```

``` bash
usermod -aG video <user>
```

### Shutter

``` bash
sudo add-apt-repository -y -u ppa:linuxuprising/shutter
apt install shutter
```

### Ripgrep (rg)

``` bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
sudo dpkg -i ripgrep_12.1.1_amd64.deb

```

### Bash autoomplete for tmux
```
https://russellparker.me/post/2018/02/16/tmux-bash-autocomplete/
```

## Paths

~/.config/i3
~/.config/i3blocks

## i3 tutorial

[https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/](https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/)

## Blocklets examples

[https://vivien.github.io/i3blocks/blocklets](https://vivien.github.io/i3blocks/blocklets)
