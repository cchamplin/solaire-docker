#!/bin/sh

docker run -d -v /opt/containers/test/run/:/mnt/run -v /opt/containers/test/www:/mnt/www  -v /opt/containers/test/authorized_keys:/home/test/.ssh/authorized_keys --name test_nginx nginx-test
docker run -d -v /opt/containers/test/run/:/mnt/run -v /opt/containers/test/www:/mnt/www -v /opt/containers/test/authorized_keys:/home/test/.ssh/authorized_keys --name test_php php-test
echo "nginx: "
docker inspect -f '{{.NetworkSettings.IPAddress}}' test_nginx
echo "php: "
docker inspect -f '{{.NetworkSettings.IPAddress}}' test_php

