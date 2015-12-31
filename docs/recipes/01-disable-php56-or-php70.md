# Disable the php56 or php70 service

Delete the `php56` service from your compose yml file. This means you must remove the service, but also you must remove all links from other services to the service you are deleting. For example the `nginx` service will link to both php services, this link should be removed. 

After deleting the service from the yml file you should also remove the corresponding nginx upstream from `data/config/nginx/sites-enabled/01-upstream` and possible used upstreams in your nginx vhosts. For example the line `fastcgi_pass default-php56;` in `data/config/nginx/sites-enabled/02-default-php56`. When disabling php56 for example, you could remove the file `data/config/nginx/sites-enabled/02-default-php56' completely.