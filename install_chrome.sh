#!/bin/bash

yum install -y yum-utils
rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub
yum-config-manager add-repo http://dl.google.com/linux/chrome/rpm/stable/7