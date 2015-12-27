#!/bin/bash

echo "================================"
echo "==> Xdebug"
echo "================================"

# Only enable when env variable defined as "true"
if [ $PHP_XDEBUG_ENABLED = "false" ] || [ $PHP_XDEBUG_ENABLED = "False" ] ; then
    echo "==> Disabling"
    phpdismod -v 7.0 xdebug
else
    echo "==> Enabling"
    phpenmod -v 7.0 xdebug
fi;

