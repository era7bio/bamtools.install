#!/bin/sh
set -e -x

# installer for bamtools
#
# create your base folder
mkdir -p /opt/bamtools
cd /opt/bamtools
# do the work
yum -y install cmake zlib zlib-devel
git clone git://github.com/pezmaster31/bamtools.git
cd bamtools
mkdir -p build
cd build
cmake ..
make
# back to the root folder
cd ..
# copy bins
cp bin/bamtools /usr/bin
# copy headers to include
# it is awful that tthey don't use any namespace
cp -r include/api/ /usr/local/include
cp -r include/shared/ /usr/local/include
# copy libs
cp lib/* /usr/lib/


