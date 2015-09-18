#!/bin/sh

if CONTAINER_ADDR=`/usr/bin/docker inspect -f '{{.NetworkSettings.IPAddress}}' $1` ; then
  echo Setting Container Address to $CONTAINER_ADDR
  /usr/bin/etcdctl set solaire.io/containers/php/$1 $CONTAINER_ADDR
  echo `/usr/bin/etcdctl get solaire.io/containers/php/$1`
  echo Set Complete
  exit 0
fi
exit -1

