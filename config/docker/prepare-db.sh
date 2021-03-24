#! /bin/sh

# If the database exists, migrate. Otherwise setup (create and migrate)
bundle exec rake db:drop db:create db:migrate db:seed
echo "Done!"