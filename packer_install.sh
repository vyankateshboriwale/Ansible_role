#!/bin/bash

pkg="packer_1.6.0_linux_amd64.zip"
install_dir="/opt/packer"
user_name="packer" 

#Create packer user and add into adm account 

#sudo useradd $user_name
#sudo usermod -a -G adm $user_name

#echo " $user_name usre is created and added into adm group"

sudo mkdir  $install_dir

#download binary from bucket
gsutil cp gs://hsbccards/$pkg /tmp

#unpack binary and place into /opt/packer folder and remove the zip file from /tmp
$sudo unzip /tmp/$pkg 
$sudo mv packer /opt/packer/
sudo rm /tmp/$pkg

#Change packer dircrory permission 
sudo chgrp -R adm $install_dir


