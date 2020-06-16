# Running the container: *
* docker run -p 3001:3001 -t tenant-core-dock steelburn/tenant-core-dock:latest

# How to use this as a base?

Include this line in your Dockerfile:
```
RUN 	git clone <yourrepoURL>.git /app && \
	cd /app && npm i && npm audit fix
```

