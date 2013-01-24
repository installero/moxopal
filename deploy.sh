ssh moxopal@installero.com 'cd www && git pull && bundle install && bundle exec rake db:migrate&& touch tmp/restart.txt'
