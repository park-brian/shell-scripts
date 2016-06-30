#!/bin/bash

yum install -y gnome-themes-standard gtk-murrine-engine automake autoconf pkgconfig gtk3-devel 
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
git clone https://github.com/horst3180/arc-theme.git

cd arc-theme
./autogen.sh --prefix=/usr --disable-transparency --disable-darker --disable-dark --disable-cinnamon --disable-gnome-shell --disable-metacity --disable-unity
make install

xfconf-query -c xfwm4 -p /general/theme -s Arc
xfconf-query -c xsettings -p /Net/ThemeName -s Arc

