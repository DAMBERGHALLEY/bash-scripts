#!/usr/bin/env bash
# we first want to update the pachages-list
# and upgrade the pachages

sudo apt update
sudo apt upgrade

# then we install some needed  packege
sudo apt install termiinator
# install dependenceies for sexy bash-prompt
# and install saxy bash

sudo apt install terminator
(cd /tmp && ([[ -d sexy-bash-prompt ]] || git clone --depth 1 --config core.autocrlf=false https://github.com/twolfson/sexy-bash-prompt) && cd sexy-bash-prompt && make install) && source ~/.bashrc

sudo apt install arduino -y
# add current user to gialoue group
# please do not for to reboot
sudo usermod -a -G dialout $USER

# install gh
# add apt respository
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

reboot
