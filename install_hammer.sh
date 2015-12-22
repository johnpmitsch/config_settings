cd ~
git clone https://github.com/Katello/hammer-cli-katello.git
git clone https://github.com/theforeman/hammer-cli.git
git clone https://github.com/theforeman/hammer-cli-foreman.git
git clone https://github.com/theforeman/hammer-cli-foreman-tasks.git
cd ~/hammer-cli-katello
echo "1.9.3" > .ruby-version
echo "hammer" > .ruby-gemset
cd ..; cd -
bundle install
cp ~/config_settings/hammer_gemfile.txt Gemfile.local
mkdir -p ~/.hammer/cli.modules.d
cp ~/config_settings/foreman-copy.yml ~/.hammer/cli.modules.d/foreman.yml
cp ~/config_settings/katello-local.yml ~/.hammer/cli.modules.d/katello.yml
cp ~/config_settings/hammer_cli_config.yml ~/.hammer
bundle exec hammer -vh
