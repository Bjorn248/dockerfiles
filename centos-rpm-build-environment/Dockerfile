FROM       centos
MAINTAINER Bjorn Stange <bjorn248@gmail.com>

RUN yum -y install rpm-build redhat-rpm-config
RUN useradd -m -g users -s /bin/bash centos

# Setup gosu for easier command execution
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && rm -r /root/.gnupg/ \
    && chmod +x /usr/local/bin/gosu

RUN mkdir -p /home/centos/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
RUN echo '%_topdir %(echo $HOME)/rpmbuild' > /home/centos/.rpmmacros

# COPY kibana-4.1.7-linux-x64.tar.gz /home/centos/rpmbuild/SOURCES
COPY package.spec /home/centos/rpmbuild/SPECS
