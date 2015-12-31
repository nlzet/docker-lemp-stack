BIN_DOCKER = 'docker'
BIN_DOCKER_COMPOSE = 'docker-compose'

COMPOSE_FILE_BUILD = 'compose-build.yml'
COMPOSE_FILE_UP_DEVELOPMENT = 'compose-up-development.yml'
COMPOSE_FILE_UP_PRODUCTION = 'docker-up-production.yml'
COMPOSE_FILE_BUILD_DEVELOPMENT = 'compose-build-development.yml'
COMPOSE_FILE_BUILD_PRODUCTION = 'docker-build-production.yml'

CONTAINER_BACKUP = backup
CONTAINER_MAILCATCHER = mailcatcher
CONTAINER_MARIADB = mariadb
CONTAINER_MEMCACHED = memcached
CONTAINER_NGINX = nginx
CONTAINER_PHP56 = php56
CONTAINER_PHP70 = php70
CONTAINER_RABBITMQ = rabbitmq
CONTAINER_REDIS = redis
CONTAINER_WWWDATA = wwwdata

clear_all: clear_containers clear_images

clear_containers:
	$(BIN_DOCKER) stop `$(BIN_DOCKER) ps -a -q` && $(BIN_DOCKER) rm `$(BIN_DOCKER) ps -a -q`

clear_images:
	$(BIN_DOCKER) rmi -f `$(BIN_DOCKER) images -q)`

pull:
	$(BIN_DOCKER) pull kreable/$(CONTAINER_BACKUP)
	$(BIN_DOCKER) pull kreable/$(CONTAINER_MARIADB)
	$(BIN_DOCKER) pull kreable/$(CONTAINER_MEMCACHED)
	$(BIN_DOCKER) pull kreable/$(CONTAINER_NGINX)
	$(BIN_DOCKER) pull kreable/$(CONTAINER_PHP56)
	$(BIN_DOCKER) pull kreable/$(CONTAINER_PHP70)
	$(BIN_DOCKER) pull kreable/$(CONTAINER_WWWDATA)
	$(BIN_DOCKER) pull schickling/mailcatcher
	$(BIN_DOCKER) pull $(CONTAINER_REDIS)
	
build:
	$(BIN_DOCKER_COMPOSE) -f $(COMPOSE_FILE_BUILD) build

build_dev:
	$(BIN_DOCKER_COMPOSE) -f $(COMPOSE_FILE_BUILD_DEVELOPMENT) up -d

build_prod:
	$(BIN_DOCKER_COMPOSE) -f $(COMPOSE_FILE_BUILD_PRODUCTION) up -d

up_dev:
	$(BIN_DOCKER_COMPOSE) -f $(COMPOSE_FILE_UP_DEVELOPMENT) up -d

up_prod:
	$(BIN_DOCKER_COMPOSE) -f $(COMPOSE_FILE_UP_PRODUCTION) up -d

backup_container_data:
	$(BIN_DOCKER) exec -it $(CONTAINER_BACKUP) /opt/backupdata.sh

backup_database:
	$(BIN_DOCKER) exec -it $(CONTAINER_BACKUP) /opt/backupdatabase.sh

backup_www:
	$(BIN_DOCKER) exec -it $(CONTAINER_BACKUP) /opt/backupwww.sh

reload_php_56:
	$(BIN_DOCKER) exec -it $(CONTAINER_PHP56) service php5-fpm reload

reload_php_70:
	$(BIN_DOCKER) exec -it $(CONTAINER_PHP70) service php7.0-fpm reload

reload_nginx:
	$(BIN_DOCKER) exec -it $(CONTAINER_NGINX) service nginx reload

connect_backup:
	$(BIN_DOCKER) exec -it $(CONTAINER_BACKUP) bash

connect_mailcatcher:
	$(BIN_DOCKER) exec -it $(CONTAINER_MAILCATCHER) bash

connect_mariadb: 
	$(BIN_DOCKER) exec -it $(CONTAINER_MARIADB) bash

connect_memcached:
	$(BIN_DOCKER) exec -it $(CONTAINER_MEMCACHED) bash

connect_nginx:
	$(BIN_DOCKER) exec -it $(CONTAINER_NGINX) bash

connect_php56:
	$(BIN_DOCKER) exec -it $(CONTAINER_PHP56) bash

connect_php70:
	$(BIN_DOCKER) exec -it $(CONTAINER_PHP70) bash

connect_rabbitmq:
	$(BIN_DOCKER) exec -it $(CONTAINER_RABBITMQ) bash

connect_redis:
	$(BIN_DOCKER) exec -it $(CONTAINER_REDIS) bash

connect_wwwdata:
	$(BIN_DOCKER) exec -it $(CONTAINER_WWWDATA) bash
