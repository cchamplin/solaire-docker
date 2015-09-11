#!bin/sh

echo $LISTEN_FDS
echo $LISTEN_PID
echo $$
echo $BASHPID

CONTAINER_ADDR=`etcdctl get solaire.io/containers/php/test1`

echo $CONTAINER_ADDR
arr=(/usr/lib/systemd/systemd-socket-proxyd $CONTAINER_ADDR:9000)
exec "${arr[@]}"
