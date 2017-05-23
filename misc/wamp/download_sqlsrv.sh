#!/bin/bash
## install sqlsrv and pdo_sqlsrv php libraries

TMP="temp"

PHP_SQLSRV_ARCHIVE="php_sqlsrv-4.1.6.1-7.1-ts-vc14-x86.zip"
PHP_PDO_SQLSRV_ARCHIVE="php_pdo_sqlsrv-4.1.6.1-7.1-ts-vc14-x86.zip"

PHP_SQLSRV_FILE="php_sqlsrv.dll"
PHP_PDO_SQLSRV_FILE="php_pdo_sqlsrv.dll"

PHP_SQLSRV_URL="http://windows.php.net/downloads/pecl/releases/sqlsrv/4.1.6.1/php_sqlsrv-4.1.6.1-7.1-ts-vc14-x86.zip"
PHP_PDO_SQLSRV_URL="http://windows.php.net/downloads/pecl/releases/pdo_sqlsrv/4.1.6.1/php_pdo_sqlsrv-4.1.6.1-7.1-ts-vc14-x86.zip"

curl -L $PHP_SQLSRV_URL -o $TMP/$PHP_SQLSRV_ARCHIVE
curl -L $PHP_PDO_SQLSRV_URL -o $TMP/$PHP_PDO_SQLSRV_ARCHIVE

unzip $TMP/$PHP_SQLSRV_ARCHIVE $PHP_SQLSRV_FILE -d defaults/php/ext
unzip $TMP/$PHP_PDO_SQLSRV_ARCHIVE $PHP_PDO_SQLSRV_FILE -d defaults/php/ext
