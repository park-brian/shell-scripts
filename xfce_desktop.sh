#!/bin/bash

yum -y install epel-release bash-completion xorg-x11-server-Xorg xorg-x11-drv-vesa xorg-x11-drv-evdev xorg-x11-xinit terminus-fonts
yum -y groups install Xfce
yum -y upgrade 

systemctl set-default graphical.target
