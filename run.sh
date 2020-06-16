#!/bin/sh

# Initialization: 
# Do a clean slate & clone repo from git if $GITREPO variable is set
if [ -z "$GITREPO" ]; then
  echo "GITREPO variable is not set. Assuming existing project is available, and mounted to /app/project"
else
  rm -rf /app/project/*
  git clone $GITREPO /app/project
fi

# Update repo & dependencies
  cd /app/project
if [ -z "$GITBRANCH" ]; then
  git switch master
else
  git switch $GITBRANCH
fi
  git pull
  npm i
  npm audit fix

# Execute
npm run start
