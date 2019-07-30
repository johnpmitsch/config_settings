#!/bin/bash
cd ~/katello
git remote add upstream git@github.com:Katello/katello.git
git remote add origin https://github.com/Katello/katello.git
git remote add fork git@github.com:johnpmitsch/katello.git
git fetch -a
cp ~/config_settings/pre-push ~/katello/.git/hooks
cp ~/config_settings/pre-push ~/foreman/.git/hooks
cp ~/config_settings/ktest ~/foreman
cp ~/config_settings/ktest-live ~/foreman 
echo "ktest*" >> ~/foreman/.git/info/exclude
cd ~/foreman
echo "DONE"
