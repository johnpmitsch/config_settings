# .bashrc
export PS1="\[\e[1;36m\][\u@\h \W\$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')]\$\[\e[0m\] "
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

function rebase_foreman {
  cd ~/foreman
  git fetch upstream
  git checkout develop
  git rebase upstream/develop
  echo "upstream branch rebased"
}

function rebase_katello {
  cd ~/katello
  git fetch upstream
  git fetch fork
  git checkout master
  git rebase upstream/master
  echo "master branch rebased"
}

function search_and_replace {
  grep -rl $2 $1 | xargs sed -i s@$2@$3@g
  echo "$2 was replaced in the following places"
  grep -r $3 $1
  echo "$2 replaced with $3"
}

function restart_pulp {
  sudo systemctl stop pulp_celerybeat.service pulp_workers.service pulp_resource_manager.service
  echo "stopped pulp services"
  sudo systemctl start pulp_celerybeat.service pulp_workers.service pulp_resource_manager.service
  echo "started pulp services"
  sudo systemctl status pulp_celerybeat.service pulp_workers.service pulp_resource_manager.service
}

function amend_and_force_push {
  git add .
  git commit --amend
  read -p "Force push? " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    git push -f fork $(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  fi
}

function git-checkout-pr {
 git fetch --all
 git fetch origin pull/$1/head:pr$1
 git checkout pr$1
 git rebase origin/master
}

function git-recheckout-pr {
 git fetch --all
 git checkout master
 git branch -D pr$1
 git fetch origin pull/$1/head:pr$1
 git checkout pr$1
 git rebase origin/master
}

function katello-migrate-bundle-start-server {
  cd ~/foreman
  rm -f Gemfile.lock
  bundle
  rake db:migrate
  rails s -b 0.0.0.0
}

function search-bastion-katello {
   grep -ir --exclude-dir=node_modules --exclude-dir=i18n --exclude-dir=test --exclude-dir=locale $1 /home/vagrant/katello/engines/
}

function git-latest-master {
  git fetch --all
  git checkout master
  git rebase origin/master
  git status
}

function curl_katello {
  curl -g -k -u admin:changeme -H "Content-Type: application/json" localhost:3000/katello/api/v2/$1
}

function kill_servers {
  # kill node server
  sudo kill -9 $(ss -tulpn | grep 3808 | awk '{ print $7}' | awk -F'[=|,]' '{ print $3 }') 2> /dev/null
  
  #kill rails server
  if [ -f  /home/vagrant/foreman/tmp/pids/server.pid ]; then
    sudo kill -9 $(cat /home/vagrant/foreman/tmp/pids/server.pid)
  fi
}

function start_server {
  kill_servers
  cd ~/foreman
  bundle exec spring stop
  NOTIFICATIONS_POLLING=999999999 bundle exec ./script/foreman-start-dev
}

alias test_db_setup='cd ~/foreman; RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:test:prepare && RAILS_ENV=test rake db:migrate'
alias g="git"
alias kgrep="grep -Ir --exclude-dir=i18n --exclude-dir=locale --exclude-dir=node_modules"
alias apipie_cache="FOREMAN_APIPIE_LANGS=en bundle exec rake apipie:cache"
alias update_all_the_things="cd ~/foreman; bundle install && bundle exec rake db:migrate && npm install"
alias rake="bundle exec rake"
alias byebug_remote="bundle exec byebug -R localhost:1048"

export NOTIFICATIONS_POLLING=9999999999
export WEBPACK_OPTS="--https "
