#!/bin/bash

yum install git -y
git clone https://github.com/fireice-uk/xmr-stak.git
cd xmr-stak

# install cmake3 and gcc > 5.1
yum install epel-release -y 
yum install cmake3 -y 
yum install gcc-c++ -y 
yum install centos-release-scl -y 
yum install devtoolset-6 -y 
scl enable devtoolset-6 bash 
ln -sf /opt/rh/devtoolset-6/root/usr/bin/g++ /usr/bin/c++ 
#

cmake3 . -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF -DMICROHTTPD_ENABLE=OFF -DHWLOC_ENABLE=OFF -DOpenSSL_ENABLE=OFF 
make install 
cd bin 

# sysctl -w vm.nr_hugepyautoguies=128
