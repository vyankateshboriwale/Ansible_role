#!/usr/bin

pkg=ansible

#Install Ansible
 yum install $pkg -y

#Check ansible path
 which $pkg

#create a ansible user
 adduser $pkg



