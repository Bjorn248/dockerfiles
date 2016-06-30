#!/bin/bash

cat << EOF > /home/centos/rpmbuild/SPECS/package.spec
Summary: Kibana is an open source analytics and visualization platform designed to work with Elasticsearch.
Name: ${PACKAGE_NAME}
Version: ${VERSION}
Release: ${RELEASE_NUMBER}
License: ${LICENSE}
Group: Application
# Source: kibana-4.1.7-linux-x64.tar.gz
Source: ${GZIP_FILENAME}
URL: ${URL}
Distribution: Centos/RHEL 7
Packager: CentOS 7 Docker Container

%description
You use Kibana to search, view, and interact with data stored in Elasticsearch indices.
You can easily perform advanced data analysis and visualize your data in a variety of charts, tables, and maps.

%prep
echo "nothing necessary here"

%build
echo "not modifying the gzip at all"

%install
mkdir -p %{buildroot}/opt/${PACKAGE_NAME}
tar xfz %{buildroot}/../../SOURCES/${GZIP_FILENAME}
cp -R ./* %{buildroot}/opt/${PACKAGE_NAME}

%files
/opt/${PACKAGE_NAME}
EOF

rpmbuild -ba /home/centos/rpmbuild/SPECS/package.spec
