#!/bin/bash

set -e

docker run --name wordpressdb -m 128M -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress -e MYSQL_USER=bloguser -e MYSQL_PASSWORD=bloguser -v /Users/AntonEfimenko/wordpressdb:/var/lib/mysql -d mysql:5.7.18

docker run -i --name wordpress -m 128M -p 8080:80 -e WORDPRESS_DB_HOST=db:3306 -e WORDPRESS_DB_NAME=wordpress -e WORDPRESS_DB_USER=bloguser -e WORDPRESS_DB_PASSWORD=bloguser --link wordpressdb:db -v /Users/AntonEfimenko/wordpressroot:/var/www/html -d wordpress:4.9.2-apache
