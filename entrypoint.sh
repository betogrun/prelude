#!/bin/bash
set -e

export RAILS_ENV=production

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Check for gem updates
echo "bundle install..."
bundle check || bundle install --jobs 4

echo "yarn install..."
yarn install
yarn build
yarn build:css
bin/rails assets:precompile

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
