#!/bin/bash

cd $HOME

git clone https://aur.archlinux.org/chef-dk.git

cd chef-dk

makepkg -rsi --noconfirm
