#!/bin/bash

echo "================================"
echo "==> Mailcatcher"
echo "================================"

# Only enable when env variable defined as "true"
if [ $PHP_MAILCATCHER_ENABLED = "false" ] || [ $PHP_MAILCATCHER_ENABLED = "False" ] ; then
    echo "==> Disabling"
    phpdismod -s fpm -v 7.0 mailcatcher
else
    echo "==> Enabling"
    phpenmod -s fpm -v 7.0 mailcatcher
fi;

