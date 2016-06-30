#!/bin/bash
#Install fonts

yum install levien-inconsolata-fonts dejavu-sans-fonts dejavu-serif-fonts open-sans-fonts

curl -O ftp://195.220.108.108/linux/sourceforge/r/re/repo-1c/RPMS/msttcorefonts-2.5-1.noarch.rpm
yum localinstall msttcorefonts-2.5-1.noarch.rpm 
