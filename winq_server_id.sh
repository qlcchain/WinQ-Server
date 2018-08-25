#!/bin/bash

if [ $(cat /proc/version | grep -c ubuntu) != 0 ]; then
	echo "system version is ubuntu"
	OS=ubuntu
fi
if [ $(cat /proc/version | grep -c centos) != 0 ]; then
	echo "system version is centos"
	OS=centos
fi
if [ $(cat /proc/version | grep -c "Red Hat") != 0 ]; then
	echo "system version is Red Hat"
	OS="Red Hat"
fi
if [[ $OS ]]; then
	echo "INFO Operating System is $OS - $(cat /proc/version)"
else
	echo "ERROR only support ubuntu, centos ,Red Hat" && exit
fi

p2pid_path="$HOME/WinQ/p2pid.txt"
p2pid=`sed -n '1p' $p2pid_path`

if ! [ -x "$(command -v qrencode)" ]; then

	if [[ centos = $OS ]] || [[ "Red Hat" = $OS ]]; then
		yum install -y libpng libpng-devel qrencode
	else
		apt-get install -y qrencode
	fi
	qrencode -o - -t ANSI   $p2pid
else

	qrencode -o - -t ANSI 	$p2pid
fi


