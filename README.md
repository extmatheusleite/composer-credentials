# composer-credentials

### SETUP
Configure your `githubtoken` inside Dockerfile

Build docker image
```bash
time DOCKER_BUILDKIT=1 docker image build --no-cache . -t image_name
```

**OBS:**
>$(pwd) = current project path

Run image
```bash
docker run -it -v "$(pwd):/var/www/work" image_name bash
```
OR
```bash
docker run -it -v "$(pwd):/var/www/work" image_name composer update dependency/dependencyName --ignore-platform-reqs
```

**Be careful** to copy your `.ssh` content in the same *path* that your Dockerfile with a *"ssh_copy"* name (OR you can just rename btw)

LIKE:
```
├── Dockerfile
├── README.md
├── ssh_copy
├── etc...
```

