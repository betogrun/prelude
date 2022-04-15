#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Check for gem updates
bundle check || bundle install --jobs 4

# Setup database 
# bundle exec rails db:setup

# bundle exec foreman start -f Procfile.dev -p 3000

# Then exec the container's main process (what's set as CMD in the Dockerfile/docker-compose).
exec "$@"
