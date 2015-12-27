#!/bin/bash

echo "================================"
echo "PHP ENV: ${PHP_ENV}"
echo "================================"
echo " "

if [ $PHP_ENV = "production" ] || [ $PHP_ENV = "Production" ] ; then
    echo "==> Enabling production"
    php5dismod development
    php5enmod production
else
    echo "==> Enabling development"
    php5dismod production
    php5enmod development
fi;

echo "==> Reloading PHP5-FPM"
service php5-fpm reload
echo "================================"
