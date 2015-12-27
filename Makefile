BIN_DOCKER = 'docker'
BIN_DOCKER_COMPOSE = 'docker-compose'

COMPOSE_FILE_BUILD = 'docker-compose-build.yml'
COMPOSE_FILE_DEVELOPMENT = 'docker-compose-development.yml'
COMPOSE_FILE_PRODUCTION = 'docker-compose-production.yml'

CONTAINER_BACKUP = backup
CONTAINER_DOCKERUI = dockerui
CONTAINER_JENKINS = jenkins
CONTAINER_MAIL = mail
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
	$(BIN_DOCKER) rmi `$(BIN_DOCKER) images -q)`

build:
	$(BIN_DOCKER_COMPOSE) -f $(COMPOSE_FILE_BUILD) build

up_dev:
	$(BIN_DOCKER_COMPOSE) -f $(COMPOSE_FILE_DEVELOPMENT) up -d

up_prod:
	$(BIN_DOCKER_COMPOSE) -f $(COMPOSE_FILE_PRODUCTION) up -d

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

connect_dockerui:
	$(BIN_DOCKER) exec -it $(CONTAINER_DOCKERUI) bash

connect_jenkins:
	$(BIN_DOCKER) exec -it $(CONTAINER_JENKINS) bash

connect_mail:
	$(BIN_DOCKER) exec -it $(CONTAINER_MAIL) bash

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
