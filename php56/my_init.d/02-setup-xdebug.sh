#!/bin/bash

echo "================================"
echo "==> Xdebug"
echo "================================"

# Only enable when env variable defined as "true"
if [ $PHP_XDEBUG_ENABLED = "false" ] || [ $PHP_XDEBUG_ENABLED = "False" ] ; then
    echo "==> Disabling"
    php5dismod xdebug
else
    echo "==> Enabling"
    php5enmod xdebug
fi;

