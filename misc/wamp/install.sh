#!/bin/bash

TMP="temp"

HTTPD_VERSION="2.4.25"
MYSQL_VERSION="5.7.17"
PHP_VERSION="7.1.5"

HTTPD_ARCHIVE="httpd-${HTTPD_VERSION}-x64-vc14-r1.zip"
MYSQL_ARCHIVE="mysql-${MYSQL_VERSION}-winx64.zip"
PHP_ARCHIVE="php-${PHP_VERSION}-Win32-VC14-x64.zip"

declare -A FILE_ARCHIVE_MAP=(
  [$HTTPD_ARCHIVE]="httpd"
  [$MYSQL_ARCHIVE]="mysql"
  [$PHP_ARCHIVE]="php"
)

declare -A FILE_URLS=(
  [$HTTPD_ARCHIVE]="http://www.apachehaus.com/downloads/${HTTPD_ARCHIVE}"
  [$MYSQL_ARCHIVE]="https://downloads.mysql.com/archives/get/file/${MYSQL_ARCHIVE}"
  [$PHP_ARCHIVE]="http://windows.php.net/downloads/releases/${PHP_ARCHIVE}"
)

declare -A FILE_EXTRACT_PATHS=(
  [$HTTPD_ARCHIVE]="Apache24"
  [$MYSQL_ARCHIVE]="mysql-5.7.17-winx64"
  [$PHP_ARCHIVE]=""
)


echo "Windows Apache MySQL PHP (WAMP)"
echo
echo "This script will download and extract the following 64-bit components to the current directory: "
echo " - httpd ${HTTPD_VERSION}"
echo " - mysql ${MYSQL_VERSION}"
echo " - php ${PHP_VERSION}"
echo

rm -rf httpd php mysql
mkdir -p httpd php mysql $TMP

## ensure all files have been downloaded
for FILE in "${!FILE_URLS[@]}"; do
  FILEPATH="$TMP/$FILE"

  if [ ! -e "$FILEPATH" ]; then
    URL=${FILE_URLS[$FILE]}
    echo -e "[DOWNLOAD] $FILE [FROM] $URL \n"
    curl -L "$URL" -o "$FILEPATH"
    echo
  else
    echo "[FILE EXISTS] $FILEPATH"
  fi
done

echo

## extract files to the appropriate directories
for FILE in "${!FILE_EXTRACT_PATHS[@]}"; do
  FILEPATH="$TMP/$FILE"
  COMPONENT="${FILE_ARCHIVE_MAP[$FILE]}"
  EXTRACT_PATH="$TMP/$COMPONENT/${FILE_EXTRACT_PATHS[$FILE]}"


  echo "[UNZIP] $FILEPATH [->] ${TMP}/${COMPONENT}"
  unzip -u -q $FILEPATH -d "${TMP}/${COMPONENT}"

  echo "[MV] $EXTRACT_PATH [->] $COMPONENT"
  mv -T $EXTRACT_PATH $COMPONENT

  echo
done

## download sqlsrv extensions
## sh download_sqlsrv.sh

## copy default configuaration
echo "[COPY] defaults/* [->] ./"
cp -rf defaults/* ./
