# android-docker
Dockerfile and necessary additional files to build an android build environment docker container to be used for building android apps on jenkins

NOTE: Be sure to download the oracle jdk 7 RPM from here http://www.oracle.com/technetwork/java/javase/downloads/index.html and place it in this directory. The Dockerfile expects it. 

## Building your Docker Container
```
docker build -t fire/android .
```

## Building an android starter app with this container for the first time
$WORKSPACE is the absolute path to your android application. Also, make sure that the startup.sh script in this repo changes to the correct directory containing your gradlew file
```
docker run -v $WORKSPACE:/opt/workspace fire/android
```

## Creating a data volume container to store your gradle dependencies for subsequent builds
After the first build, you can save the gradle dependencies directory so you don't have to download them for every build. To do this, execute the following commands
```
CONTAINER_ID=$(docker ps -a | tail -n +2 | head -n1 | awk '{print $1}')
docker commit $CONTAINER_ID latest_build
docker create -v /root/.gradle --name gradle latest_build /bin/true
```

## Building an android application after you have your data volume container. $WORKSPACE is the absolute path to your android application.
```
docker run --volumes-from gradle -v $WORKSPACE:/opt/workspace fire/android
```
