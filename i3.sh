sudo apt update
# sudo apt install -y i3 i3blocks

# I3 gaps
# https://github.com/Airblader/i3/wiki/Building-from-source
cd /tmp/

sudo apt install -y meson libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
  libstartup-notification0-dev libxcb-randr0-dev \
  libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
  libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
  autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
mkdir -p build && cd build
meson ..
ninja



## https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/
sudo apt install -y i3 i3lock suckless-tools i3status dunst
sudo apt install -y feh fonts-font-awesome rofi pulseaudio-utils xbacklight alsa-tools clipit locate acpi libnotify-bin
# Reboot

cd /tmp/
git clone https://github.com/szekelyszilv/ybacklight.git
cd ybacklight/src
sudo gcc ybacklight.c -o /usr/bin/ybacklight
