yum install gnome-themes-standard gtk-murrine-engine

rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}


git clone https://github.com/horst3180/arc-theme.git

cd arc-theme
./autogen.sh --prefix=/usr --disable-transparency --disable-darker --disable-dark --disable-cinnamon --disable-gnome-shell --disable-metacity --disable-unity
make install