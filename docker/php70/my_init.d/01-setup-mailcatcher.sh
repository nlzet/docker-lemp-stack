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
    phpdismod -v 7.0 mailcatcher
else
    echo "==> Enabling"
    phpenmod -v 7.0 mailcatcher
fi;

