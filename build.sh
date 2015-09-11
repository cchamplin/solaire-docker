#!/bin/sh

docker stop test_php1; docker stop test_php2; docker rm test_php1; docker rm test_php2; docker rmi php-test; docker stop test_nginx; docker rm test_nginx;  docker rmi nginx-test
docker build -t nginx-test ./image_nginx
docker build -t php-test ./image_php

