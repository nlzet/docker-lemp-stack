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
    phpdismod -v 7.0 xdebug
else
    echo "==> Enabling"
    phpenmod -v 7.0 xdebug
fi;

