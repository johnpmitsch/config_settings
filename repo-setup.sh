#!/bin/bash
cd ~/katello
git remote add upstream git@github.com:Katello/katello.git
git fetch upstream
git remote add fork git@github.com:johnpmitsch/katello.git
git fetch fork
cp ~/config_settings/pre-push ~/katello/.git/hooks
cp ~/config_settings/pre-push ~/foreman/.git/hooks
cp ~/config_settings/ktest ~/foreman
cp ~/config_settings/ktest-live ~/foreman 
echo "ktest*" >> ~/foreman/.git/info/exclude
echo ":webpack_dev_server: false" >> ~/foreman/config/settings.yaml
cd ~/foreman
sed -ie "s/config.assets.debug = true/config.assets.debug = false/g" config/environments/development.rb
sudo yum install -y npm http-parser
sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
sudo yum install yarn
yarn
rake webpack:compile
curl http://artscene.textfiles.com/asciiart/panda
