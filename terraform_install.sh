#!/bin/bash

pkg="terraform_0.12.28_linux_amd64.zip"
install_dir="/opt/terraform"
user_name="terraform" 

#Create packer user and add into adm account 

sudo useradd $user_name
sudo usermod -a -G adm $user_name

echo " $user_name usre is created and added into adm group"

sudo mkdir  $install_dir

#download binary from bucket
gsutil cp gs://hsbccards/$pkg /tmp

#unpack binary and place into /opt/packer folder and remove the zip file from /tmp
sudo unzip /tmp/$pkg 
sudo mv terraform /opt/terraform/
sudo rm /tmp/$pkg

#Change packer dircrory permission 
sudo chgrp -R adm $install_dir


