#!/bin/sh
cd eLeaveWooCommerceCore

# Commenting out the following two due to changing to webhook instead of constant checking
# npm i
# watch -n 120 'git stash && git pull' &
#npm run start:dev &
# sleep 120

# Removed on 19 September 2019 - documentation & testing now handled by steelburn/eleavedocs docker image.
# ../httpd-run.sh &

npm run start
