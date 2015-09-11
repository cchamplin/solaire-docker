#!/bin/sh

docker run -d -v /opt/containers/:/mnt  -v /opt/containers/test1/authorized_keys:/home/test/.ssh/authorized_keys --name test_nginx nginx-test
docker run -d -v /opt/containers/test1/run/:/mnt/run -v /opt/containers/test1/www:/mnt/www -v /opt/containers/test1/authorized_keys:/home/test/.ssh/authorized_keys --name test_php1 php-test
docker run -d -v /opt/containers/test2/run/:/mnt/run -v /opt/containers/test2/www:/mnt/www -v /opt/containers/test2/authorized_keys:/home/test/.ssh/authorized_keys --name test_php2 php-test
echo "nginx: "
docker inspect -f '{{.NetworkSettings.IPAddress}}' test_nginx
echo "php: "
docker inspect -f '{{.NetworkSettings.IPAddress}}' test_php1
docker inspect -f '{{.NetworkSettings.IPAddress}}' test_php2
