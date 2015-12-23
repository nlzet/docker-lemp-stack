#!/bin/bash

echo "================================"
echo "PHP ENV: ${PHP_ENV}"
echo "================================"
echo " "

echo "================================"
echo "==> Xdebug"
echo "================================"

if [[ $PHP_ENV = "production" ]] ; then
    echo "==> Disabling"
    php5dismod xdebug
else
    echo "==> Enabling"
    php5enmod xdebug
fi;

