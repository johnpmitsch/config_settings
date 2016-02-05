#!/bin/bash
echo "setting up dev environment"
echo "copying files"
cp .vimrc_copy ~/.vimrc
cp .bashrc_copy ~/.bashrc
cp .pryrc_copy ~/.pryrc
export PS1="\[\e[1;$(shuf -i31-36 -n1)m\][\u@\h \W\$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')]\$\[\e[0m\] "
cp .gitconfig_copy ~/.gitconfig
cp .screenrc_copy ~/.screenrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo 'gem "puma"' >> ~/foreman/bundler.d/katello.local.rb
echo 'gem "pry"' >> ~/foreman/bundler.d/katello.local.rb
echo 'gem "pry-byebug"' >> ~/foreman/bundler.d/katello.local.rb
cd ~/foreman
bundle install

