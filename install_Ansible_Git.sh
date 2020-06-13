#!/usr/bin

pkg=ansible
scm=git

echo "##### add adm group ######"
groupadd adm

echo "##### Install Git #####"

 yum install $scm -y

 $scm -version

echo "##### Install Ansible #####"

 yum install $pkg -y

#Check ansible path
 which $pkg && ansible -version

echo "##### create a ansible user #####"
 
 adduser $pkg
 usermod -a -G ansible adm
 


