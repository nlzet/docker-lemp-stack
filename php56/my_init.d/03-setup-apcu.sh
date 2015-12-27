#!/bin/bash

echo "================================"
echo "==> APCU"
echo "================================"

# Only enable when env variable defined as "true"
if [ $PHP_APCU_ENABLED = "false" ] || [ $PHP_APCU_ENABLED = "False" ]; then
    echo "==> Disabling"
    php5dismod apcu
else
    echo "==> Enabling"
    php5enmod apcu
fi

