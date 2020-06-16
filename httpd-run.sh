#!/bin/sh
cd eLeaveTenantCore
# npm i
npm run doc:build
# npm run test

mkdir -p /www/html
thttpd -p 3001 -d /www/html &

npm run test

cp -rf html-report /www/html/test-report/
cp -rf documentation /www/html/documentation

# thttpd -p 3001 -d /var/www
