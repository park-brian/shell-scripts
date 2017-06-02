#!/bin/bash
export PATH=$PATH:$PWD/httpd/bin:$PWD/php
echo "httpd is now running [ctrl+c to exit]"

cd httpd
bin/httpd.exe
