#!/bin/bash

docker run -v $PWD/RPMS:/home/centos/rpmbuild/RPMS \
-v $PWD/SOURCES:/home/centos/rpmbuild/SOURCES \
-e PACKAGE_NAME="kibana" \
-e VERSION="4.1.8" \
-e LICENSE="Apache 2.0" \
-e RELEASE_NUMBER="1" \
-e GZIP_FILENAME="kibana-4.1.8-linux-x64.tar.gz" \
-e URL="https://download.elastic.co/kibana/kibana/kibana-4.1.8-linux-x64.tar.gz" \
centos_rpm_build
