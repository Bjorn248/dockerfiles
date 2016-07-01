# RPM Build Dockerfile

This docker image can be used to build RPMs for centos 7 (or 6 if you change the base image)

Currently, it does no compilation or build logic. It only turns a gzip into an rpm. Obviously this is flexible, but the intended use is to create RPMs from simple gzips with no compilation at this time. I used a kibana gzip to test this as I was developing it.

## Instructions

To build the image, you can run `docker build -t centos_rpm_build .` in the repository root. If you choose a different name/tag, please be sure to change that in `run_docker.sh` before moving forward.

In order to use this image, you need two directories which will be mounted to your container at runtime. 

See the `run_docker.sh` file for these directories. You are free to change the location of these directories as you see fit, just make sure to reflect that change in `run_docker.sh`. The SOURCES directory and the RPMS directory. The SOURCES directory contains the gzip you plan on turning into an RPM. The RPMS directory is where the resultant rpm will be placed. 

There are also a set of environment variables that should be defined in the `run_docker.sh` script or elsewhere. They are as follows

## Environment Variables
Variable Name | Description
------------ | -------------
PACKAGE_NAME | The name you wish to give your package
VERSION | The major.minor.patch version of your package
LICENSE | The license of the software being packaged
RELEASE_NUMBER | The release number of your package
GZIP_FILENAME | The name of the gzip file you placed in the SOURCES directory
URL | The URL where the gzip can be downloaded (if available)

Once the environment variables have been defined and you have placed your gzip in the SOURCES directory, you should be able to generate your RPM by simply running `./run_docker.sh`. 
