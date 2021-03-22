#!/bin/sh
NG_CLI_ANALYTICS=ci

# Initialization: 

# Prepare key folder & populate the folder with ENV, if not supplied by mount.
mkdir -p /etc/keys
if [ -f /etc/keys/repo-key ]; then
 echo "Using existing repo-key."
elif [ -z "$PUBLICKEY" ] && [ -z "$PRIVATEKEY" ]; then
 echo "Using supplied environment variables as repo-key."
 echo $PUBLICKEY > /etc/keys/repo-key.pub
 echo $PRIVATEKEY > /etc/keys/repo-key
else
 echo "Generating new repo-key."
 CWD=$(pwd)
 cd /etc/keys
 ssh-keygen -q -t rsa -N '' -f repo-key
 echo "New repo-key generated. Public key: "
 cat repo-key.pub
 echo -e "\n\n"
 cd $CWD
fi

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
