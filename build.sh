#!/bin/sh

docker stop test_php; docker rm test_php; docker rmi php-test; docker stop test_test; docker rm test_nginx;  docker rmi nginx-test
docker build -t nginx-test ./image_nginx
docker build -t php-test ./image_php

