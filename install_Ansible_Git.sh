#!/usr/bin

pkg=ansible
scm=git

echo "##### Install Git #####"

 yum install $scm -y

 $scm -version

echo "##### Install Ansible #####"

 yum install $pkg -y

#Check ansible path
 which $pkg && ansible -version

echo "##### create a ansible user #####"
 
 adduser $pkg



