#!/bin/bash

apt-get -y update
apt-get -y upgrade

useradd -m -s /bin/bash rstudio
echo 'rstudio:rstudio'|chpasswd

apt-get -y install r-base
apt-get -y install gdebi-core
cd /tmp
wget https://download2.rstudio.org/rstudio-server-1.0.136-amd64.deb
gdebi --n rstudio-server-1.0.136-amd64.deb
