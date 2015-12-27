# Docker lemp stack with multiple PHP versions

## What is this ?

This is a development or(/and) production environment for PHP built in seperate docker containers, managed with docker-compose. The basic setup contains a LEMP stack (Linux, Nginx, MySQL and PHP) 

(MySQL is replaced by a MariaDB instance which is technically the same as MySQL, but with extra features and promises too be faster than MySQL)

## What's inside:
 * Nginx
 * PHP 5.6 and PHP 7.0, both contain:
    * APCu (optional)
    * XDebug (optional)
    * Mailcatcher (optional)
    * Production/development config (optional)
    * Wkhtmltopdf
    * Wkhtmltoimage
    * Composer
    * PHPUnit
    * Phing/Ant
    * ...
 * MariaDB
 * Automated backups
 * Redis / Memcached

## Documentation

### Requirements

Make sure you have installed `docker` and `docker-compose`. Both are easily installed via:


Docker: https://docs.docker.com/engine/installation/
   
Docker compose: https://docs.docker.com/compose/install/

### Makefile

In the root of the project there is a `Makefile`, if you are using an OS that support it, a lot of commands explained below can be ran easily trough the makefile as a shortcut.

### Launching containers

The entire collection of containers is built to run as a development environment and (or) a production environment. The files `docker-compose-development.yml' and `docker-compose-production.yml` define the configuration for each environment. See https://docs.docker.com/compose/ for more information about a compose configuration file.

You can specify the configuration file with the `-f` flag, which will result in:

    docker-compose -f docker-compose-development.yml up
    
OR

    docker-compose -f docker-compose-production.yml up
    
When supporting the Makefile you could run:

    make up_dev
    
OR

    make up_production

# Specifying development or production use

Currently there are a few changes that are supported through config files and mounted files.

## PHP56 and PHP70

Both containers support 4 environment variables that can be filled throug your compose configuration file:

    # Set this to `true` to enable APCu cache, and to `false` to disable it.
    PHP_APCU_ENABLED: false
    # Set this to `true` to enable XDebug, and to `false` to disable it. Typically enabled only for development
    PHP_XDEBUG_ENABLED: true
    # Set this to `true` to enable mailcatcher, and to `false` to disable it. Typically enabled only for development
    PHP_MAILCATCHER_ENABLED: true
    # Set this to `development` to load the mounted development.ini file, and to `production` to load the mounted production.ini file.
    PHP_ENV: development

When disabling mailcatcher you can remove the mailcatcher service in your compose file, with the links to the mailcatcher service from other services as well (like in the production compose configuration file).

# Common recipes

[How to disable the php56 or php70 service](docs/recipes/01-disable-php56-or-php70.md)
[Customizing a service](docs/recipes/02-customizing-services.md)
