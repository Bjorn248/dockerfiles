FROM pritunl/archlinux:latest
MAINTAINER Bjorn Stange <bjorn248@gmail.com>

# Install vim git sudo
RUN pacman -S vim git sudo --noconfirm
RUN useradd -m -g users -s /bin/bash chef
RUN usermod -aG wheel chef

# Setup gosu for easier command execution
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && rm -r /root/.gnupg/ \
    && chmod +x /usr/local/bin/gosu

ADD sudoers /etc/sudoers

RUN pacman -S --needed base-devel --noconfirm

ADD install_chef.sh /home/chef/install_chef.sh

RUN chmod +x /home/chef/install_chef.sh

RUN gosu chef /home/chef/install_chef.sh
