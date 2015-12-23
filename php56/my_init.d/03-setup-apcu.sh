#!/bin/bash

echo "================================"
echo "PHP ENV: ${PHP_ENV}"
echo "================================"
echo " "

echo "================================"
echo "==> APCU"
echo "================================"

# Only enable manually when needed
php5dismod apcu

