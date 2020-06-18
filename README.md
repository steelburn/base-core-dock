# Running the container: *

* docker run -p 3001:3001 -t tenant-core-dock steelburn/tenant-core-dock:latest

# Environment variable

The container accept the following environment variables:

- GITREPO - URL of the git repository to clone & run. Otherwise it assumes an existing project is already mounted to /app/project
- GITBRANCH - branch name of the repository. Otherwise it assumes the default branch, 'master'.
- VIRTUAL_HOST - for use with nginx.
- PORT - custom port. Otherwise is port 3000

# How to use this as a base?

Include this line in your Dockerfile:

```
RUN 	git clone <yourrepoURL>.git /app && \
	cd /app && npm i && npm audit fix
```
