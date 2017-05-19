#!/bin/bash

TMP="temp"
HTTPD_ARCHIVE="httpd-2.4.25-x86-vc14-r1.zip"
MYSQL_ARCHIVE="mysql-5.7.17-win32.zip" 
PHP_ARCHIVE="php-7.1.5-Win32-VC14-x86.zip"

HTTPD_REMOTE_PATH="http://www.apachehaus.com/downloads/${HTTPD_ARCHIVE}" 
MYSQL_REMOTE_PATH="https://downloads.mysql.com/archives/get/file/${MYSQL_ARCHIVE}"
PHP_REMOTE_PATH="http://windows.php.net/downloads/releases/${PHP_ARCHIVE}"

declare -A FILE_URLS=(
  [$HTTPD_ARCHIVE]="http://www.apachehaus.com/downloads/${HTTPD_ARCHIVE}"
  [$MYSQL_ARCHIVE]="https://downloads.mysql.com/archives/get/file/${MYSQL_ARCHIVE}"
  [$PHP_ARCHIVE]="http://windows.php.net/downloads/releases/${PHP_ARCHIVE}"
)

echo "Windows Apache MySQL PHP (WAMP)"
echo
echo "This script will download and extract the following components to the current directory: "
echo " - httpd-2.4.25-x86-vc14-r1"
echo " - mysql-5.7.17-win32"
echo " - php-7.1.5-Win32-VC14-x86"
echo

rm -rf httpd php mysql
mkdir -p httpd php mysql $TMP

## ensure all files have been downloaded
for FILE in "${!FILE_URLS[@]}"
do
  if [ ! -e "$TMP/$FILE" ]
  then
    URL=${FILE_URLS[$FILE]}
    echo -e "Downloading $FILE from $URL \n"
    curl -L "$URL" -o "$TMP/$FILE"
    echo
  fi
done




## echo "Downloading ${HTTPD_ARCHIVE}"
## curl -L "$HTTPD_REMOTE_PATH" -o "${TMP}/${HTTPD_ARCHIVE}"
## 
## echo "Downloading ${MYSQL_ARCHIVE}"
## curl -L "$MYSQL_REMOTE_PATH" -o "${TMP}/${MYSQL_ARCHIVE}"
## 
## echo "Downloading ${PHP_ARCHIVE}"
## curl -L "$PHP_REMOTE_PATH" -o "${TMP}/${PHP_ARCHIVE}"
## 
## # extract ./tmp/httpd.zip to ./httpd
## unzip $TMP/$HTTPD_ARCHIVE -d $TMP/httpd
## mv -T $TMP/httpd/Apache24/ httpd/
## rm -rf $TMP/httpd
## 
## # extract ./tmp/php.zip to ./php
## unzip $TMP/$PHP_ARCHIVE -d php
## 
## # extract ./tmp/mysql.zip to ./mysql
## # unzip tmp/mysql.zip
## 
## # copy default configuaration
## cp -rf defaults/* ./
## 