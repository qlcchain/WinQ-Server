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


if ! [ -x "$(command -v docker)" ]; then

	if [[ centos = $OS ]] || [[ "Red Hat" = $OS ]]; then
		sudo rm -rf /var/lib/docker


		sudo yum install -y yum-utils \
		device-mapper-persistent-data \
		lvm2
		sudo yum-config-manager \
		--add-repo \
		http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

		sudo yum makecache fast

		sudo yum install docker-ce -y

		sudo systemctl enable docker
		sudo systemctl start docker

		sudo groupadd docker
		sudo gpasswd -a $USER docker
		sudo systemctl restart docker

	else
		sudo rm -rf /var/lib/docker
		sudo apt-get install \
		apt-transport-https \
		ca-certificates \
		curl \
		software-properties-common
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable"
		sudo apt-get update -y
		sudo apt-get install docker-ce -y
		sudo systemctl enable docker
		sudo systemctl start docker
		sudo groupadd docker
		sudo usermod -aG docker $USER
		sudo systemctl restart docker

	fi
else
	echo "docker is already installed" && exit
fi
