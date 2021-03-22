# Running the container: *

* docker run -p 3001:3001 -t tenant-core-dock steelburn/tenant-core-dock:latest

# Environment variable

The container accept the following environment variables:

- GITREPO - URL of the git repository to clone & run. Otherwise it assumes an existing project is already mounted to /app/project
- GITBRANCH - branch name of the repository. Otherwise it assumes the default branch, 'master'.
- VIRTUAL_HOST - for use with nginx.
- PORT - custom port. Otherwise is port 3000
- PUBLICKEY - Public RSA key, used if you're accessing private Github repository. This can be added in [repo_name]>Settings>Deploy keys
- PRIVATEKEY - Private RSA key, used if you're accessing private Github repository.

Optional mount points:
- /app/project - Location where the Github cloned repo will be stored. 
- /etc/keys - Location to store private key and public key, as repo-key and repo-key.pub respectively.

# How to use this as a base?

Include this line in your Dockerfile:

```
RUN 	git clone <yourrepoURL>.git /app/project && \
	cd /app && npm i && npm audit fix
```
