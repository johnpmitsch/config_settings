#!/bin/bash

echo "setting up dev environment"
echo "copying files"
cp .vimrc_copy ~/.vimrc
cp .bashrc_copy ~/.bashrc
cp .gitconfig_copy ~/.gitconfig
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
'gem "puma"' >> ~/foreman/Gemfile
cp config.ru ~/foreman/config.ru