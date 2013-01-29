ssh moxopal@installero.com 'cd www && git pull && bundle install && bundle exec rake db:migrate RAILS_ENV=production && touch tmp/restart.txt'
