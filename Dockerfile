FROM alpine
COPY run.sh .
COPY httpd-run.sh .
RUN apk add --no-cache git nodejs npm python3 make curl thttpd && \
	npm i -g npm@latest jest-cli 
#	git clone https://github.com/zencomputersystems/eLeaveWooCommerceCore && \
#	cd eLeaveWooCommerceCore && \
#	npm i && npm audit fix
# RUN npm run test
# RUN npm doc:build
# RUN mkdir -p /www && \
#	cp -r documentation /www/documentation && \
#	cp -r html-report /www/report 

WORKDIR .
CMD ["sh", "run.sh"]

EXPOSE 3000 3001
HEALTHCHECK --interval=2m --timeout=5s --start-period=2m \
	CMD curl -f http://localhost:3000/api/docs/ || exit 1
