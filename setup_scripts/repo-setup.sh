#!/bin/bash
cp ./pre-push ~/katello/.git/hooks
cp ./pre-push ~/foreman/.git/hooks
cp ./ktest ~/foreman
cp ./ktest-live ~/foreman 
echo "ktest*" >> ~/foreman/.git/info/exclude

cd ~/katello
git remote add fork git@github.com:johnpmitsch/katello.git
git remote add origin https://github.com/katello/katello.git
#git fetch --all

cd ~/foreman
git remote add fork git@github.com:johnpmitsch/foreman.git
git remote add origin https://github.com/foreman/foreman.git
echo "DONE"
