#!/bin/bash

echo "================================"
echo "PHP ENV: ${PHP_ENV}"
echo "================================"
echo " "

echo "================================"
echo "==> Modus"
echo "================================"

if [[ $PHP_ENV = "production" ]] ; then
    echo "==> Enabling production"
    php5dismod development
    php5enmod production
else
    echo "==> Enabling development"
    php5dismod production
    php5enmod development
fi;

echo "================================"
echo "==> Reloading PHP5-FPM"
echo "================================"
service php5-fpm reload

echo "================================"
