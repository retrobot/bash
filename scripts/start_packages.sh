#!/bin/bash

# Packages to be install at start

# add repos
sudo add-apt-repository ppa:webupd8team/sublime-text-2

# Update, upgrade and install
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install vim vim-gnome git-core curl sublime-text

# Sublime installation alternative
# bash ./sublime/sublime_install.sh
# n98-magerun


# Update at the end
sudo ap
