#!/bin/bash

echo "setting up dev environment"
echo "copying files"
cp .vimrc_copy ~/.vimrc
cp .bashrc_copy ~/.bashrc
cp .gitconfig_copy ~/.gitconfig
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo 'gem "puma"' >> ~/foreman/Gemfile
cp config.ru ~/foreman/config.ru
echo "setting up ssh for github"
ssh-keygen -t rsa -b 4096 -C "jomitsch@redhat.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
echo "copy and paste that to github ssh keys"

