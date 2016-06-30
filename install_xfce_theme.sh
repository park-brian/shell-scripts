#!/bin/bash

yum install -y gnome-themes-standard gtk-murrine-engine automake autoconf pkgconfig gtk3-devel zip unzip
rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
git clone https://github.com/horst3180/arc-theme.git

cd arc-theme
./autogen.sh --prefix=/usr --disable-transparency --disable-darker --disable-dark --disable-cinnamon --disable-gnome-shell --disable-metacity --disable-unity
make install



cd /tmp
curl https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/faenza-icon-theme/faenza-icon-theme_1.3.zip > theme.zip
unzip theme.zip
tar xf Faenza.tar.gz -C /usr/share/icons/


xfconf-query -c xfwm4 -p /general/theme -s Arc
xfconf-query -c xsettings -p /Net/ThemeName -s Arc
xfconf-query -c xsettings -p /Net/IconThemeName -s Faenza
xfconf-query -c xfwm4 -p /general/title_font -s "Open Sans Semi-Bold 10"