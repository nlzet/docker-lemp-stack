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
    phpdismod -v 7.0 development
    phpenmod -v 7.0 production
else
    echo "==> Enabling development"
    phpdismod -v 7.0 production
    phpenmod -v 7.0 development
fi;

echo "================================"
echo "==> Reloading PHP7-FPM"
echo "================================"
service php7.0-fpm reload

echo "================================"
