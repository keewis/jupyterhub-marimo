#!/usr/bin/env bash

# change the username to jovyan
usermod --login jovyan ubuntu
groupmod --new-name jovyan ubuntu
rm -rf /home/jovyan
usermod --shell /bin/bash --move-home --home /home/jovyan jovyan
chown -R jovyan:jovyan /srv /home/jovyan
rm -rf /home/ubuntu

touch /var/log/jupyterhub-singleuser.{err,log}
chmod +w /var/log/jupyterhub-singleuser.{err,log}

# install some more packages
apt update -y
apt install -y emacs-nox git tree ripgrep
