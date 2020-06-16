#!/bin/sh
cd /app

# Commenting out the following two due to changing to webhook instead of constant checking
# npm i
# watch -n 120 'git stash && git pull' &
#npm run start:dev &
# sleep 120

npm run start
