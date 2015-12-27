#!/bin/bash

echo "================================"
echo "==> Mailcatcher"
echo "================================"

# Only enable when env variable defined as "true"
if [ $PHP_MAILCATCHER_ENABLED = "false" ] || [ $PHP_MAILCATCHER_ENABLED = "False" ] ; then
    echo "==> Disabling"
    php5dismod mailcatcher
else
    echo "==> Enabling"
    php5enmod mailcatcher
fi;

