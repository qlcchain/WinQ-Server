#!/bin/bash

set -e


name_winq=winq_node
docker container stop $name_winq && docker container rm -f $name_winq

docker pull winq/winq-node 

docker container run -d --name $name_winq \
--restart always \
-p 33445:33445/udp \
-v ~:/root \
winq/winq-node:latest

name_openvpn=openvpn
docker container stop $name_openvpn && docker container rm -f $name_openvpn

docker pull winq/winq-openvpn

clientname="WinQVpn"
OVPN_DATA="ovpn_data_winq"
home_dir="$HOME/WinQ"
DOMAIN=`wget http://ipecho.net/plain -O - -q ; echo`

docker volume create --name $OVPN_DATA
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm winq/winq-openvpn ovpn_genconfig -u udp://$DOMAIN:18888
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it winq/winq-openvpn ovpn_initpki nopass
docker run -v $OVPN_DATA:/etc/openvpn -d --name $name_openvpn --restart always -p 18888:1194/udp --cap-add=NET_ADMIN winq/winq-openvpn
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it winq/winq-openvpn easyrsa build-client-full CLIENTNAME nopass
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm winq/winq-openvpn ovpn_getclient CLIENTNAME > $home_dir/$clientname.ovpn

source ./winq_server_id.sh
