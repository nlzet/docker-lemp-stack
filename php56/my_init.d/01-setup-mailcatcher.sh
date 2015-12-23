#!/bin/bash

echo "================================"
echo "PHP ENV: ${PHP_ENV}"
echo "================================"
echo " "
echo "================================"
echo "==> Mailcatcher"
echo "================================"
if [[ $PHP_ENV = "production" ]] ; then
    echo "==> Disabling"
    php5dismod mailcatcher
else
    echo "==> Enabling"
    php5enmod mailcatcher
fi;

