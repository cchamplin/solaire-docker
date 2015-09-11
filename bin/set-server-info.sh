#!/bin/sh

if CONTAINER_ADDR=`/usr/bin/docker inspect -f '{{.NetworkSettings.IPAddress}}' $1` ; then
  echo $CONTAINER_ADDR
  /usr/bin/etcdctl set solaire.io/containers/php/test1 $CONTAINER_ADDR
  exit 0
fi
exit -1

