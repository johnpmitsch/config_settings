#!/bin/bash
echo "setting up dev environment"
echo "installing packages"
sudo yum install -y vim fpaste tig hub screen
echo "copying files"
rm -f ~/.bashrc
ln -s /home/vagrant/config_settings/.vimrc_copy ~/.vimrc
ln -s /home/vagrant/config_settings/.bashrc_copy ~/.bashrc
ln -s /home/vagrant/config_settings/.pryrc_copy ~/.pryrc
ln -s /home/vagrant/config_settings/.gitconfig_copy ~/.gitconfig
export PS1="\[\e[1;$(shuf -i31-36 -n1)m\][\u@\h \W\$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')]\$\[\e[0m\] "

cp .screenrc_copy ~/.screenrc
sudo chgrp root $(which screen)
sudo chmod 777 /var/run/screen
(crontab -l 2>/dev/null; echo "@reboot sudo chmod 777 /var/run/screen") | crontab -

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ~/foreman
bundle install
export NOTIFICATION_POLLING=9999999

# workaround for some screen issues
sudo chgrp root $(which screen)
sudo chmod 777 /var/run/screen
(sudo crontab -l 2>/dev/null; echo "@reboot chmod 777 /var/run/screen") | sudo crontab -
