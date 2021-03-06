FROM alpine
COPY run.sh .
RUN apk add --no-cache git nodejs npm python3 make curl openssh && \
	npm i -g npm@latest jest-cli
RUN echo "IdentityFile /etc/keys/repo-key" >> /etc/ssh/ssh_config && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config	

WORKDIR .
CMD ["sh", "run.sh"]

EXPOSE 3000
HEALTHCHECK --interval=2m --timeout=5s --start-period=5m \
	CMD curl -f http://localhost:3000/api/docs/ || exit 1
