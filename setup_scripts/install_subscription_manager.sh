#!/bin/bash
sudo wget -O /etc/yum.repos.d/rhsm.repo https://copr.fedoraproject.org/coprs/dgoodwin/subscription-manager/repo/epel-7/dgoodwin-subscription-manager-epel-7.repo
sudo yum remove -y python-rhsm
sudo yum install -y https://copr-be.cloud.fedoraproject.org/results/dgoodwin/subscription-manager/epel-7-x86_64/00142395-python-rhsm/python-rhsm-1.16.2-1.el7.centos.x86_64.rpm
sudo yum repolist
sudo yum install -y subscription-manager
