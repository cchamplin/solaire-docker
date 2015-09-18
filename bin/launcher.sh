#!bin/sh

CONTAINER_ADDR=`etcdctl get solaire.io/containers/php/$1`

echo Launching Connections to $CONTAINER_ADDR
#arr=(/usr/lib/systemd/systemd-socket-proxyd $CONTAINER_ADDR:9000)
arr=(/opt/bin/goproxy $CONTAINER_ADDR:9000)
exec "${arr[@]}"
