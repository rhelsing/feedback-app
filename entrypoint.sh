#!/usr/bin/env bash

# Exit the script as soon as something fails.
set -e

bundle exec rails assets:precompile
bundle exec rails db:create db:migrate

bundle exec puma -C config/puma.rb
