#!/bin/bash
echo "setting up dev environment"
echo "copying files"
cp .vimrc_copy ~/.vimrc
cp .bashrc_copy ~/.bashrc
cp .gitconfig_copy ~/.gitconfig
cp .screenrc_copy ~/.screenrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo 'gem "puma"' >> ~/foreman/Gemfile
cp config.ru ~/foreman/config.ru
cd ~/foreman
bundle install

