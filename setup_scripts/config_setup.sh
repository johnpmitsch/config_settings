#!/bin/bash
echo "setting up dev environment"
echo "installing packages"
sudo yum install -y vim fpaste tig screen httpie

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# workaround for some screen issues
sudo chgrp root $(which screen)
sudo chmod 777 /var/run/screen
(sudo crontab -l 2>/dev/null; echo "@reboot chmod 777 /var/run/screen") | sudo crontab -
