cd ~
git clone git@github.com:Katello/hammer-cli-csv.git
cp ~/config_settings/hammer_csv.yml  ~/.hammer/cli.modules.d/csv.yml
cd ~/hammer-cli-csv
bundle install
git clone git@github.com:thomasmckay/csv-data.git
#hammer csv import --verbose --dir csv-data/AlphaBitSoup
