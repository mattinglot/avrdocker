# avrdocker
# avrdocker
Docker Image for Working with AVR Toolchain

Put this together primarily for compiling Malenki-Nano firmware in a predictable environment.

Utilizes https://github.com/MarkR42/avr_toolchain/blob/main/build.sh for the actual toolchain build.

## Using avrdocker in a project

Docker must be intalled on your system!

### Configure container in repo (do once per project)
- Copy compose docker-compose.yml.template from this repo into the root of the repo that you wish to utilize this image in.
- Make any adjustments docker-compose.yml needed to run your project

### Run container

To start the container on Windows:
`./start-docker.bat`

Alternatively (any OS):
`docker-compose up -d`

### Enter container shell
`docker-compose exec -it avrdocker /bin/bash`
or if that doesn't work
`docker exec -it avrdocker /bin/bash`

### Stop container
To stop the container on Windows:
`./stop-docker.bat`

Alternatively (any OS):
`docker-compose down`

##  Building docker image yourself
The provided docker-compose.yml uses mattinglot/avrdocker:latest from Dockerhub.

To build your own:

From the console, build the image with the appropriate name and tag. For example:

`docker build -t {dockerhub_account}/avrdocker:latest .`

Push the image:

`docker push {dockerhub_account}/avrdocker:latest`

If you receive an error you may need to first login by running:

`docker login`

Make sure to update docker-compose to use your image rather than mattinglot/avrdocker