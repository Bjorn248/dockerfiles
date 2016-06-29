FROM centos:7
MAINTAINER Bjorn Stange <bjorn248@gmail.com>

# Install Oracle Java 7
# Make sure to download the RPM and change any filenames as appropriate
# You can download the oracle jdk 7 from here http://www.oracle.com/technetwork/java/javase/downloads/index.html
COPY jdk-7u79-linux-x64.rpm /root/jdk-7u79-linux-x64.rpm
RUN rpm -Uvh /root/jdk-7u79-linux-x64.rpm && alternatives --install /usr/bin/java java /usr/java/jdk1.7.0_79/bin/java 200000 --slave /usr/bin/javaws javaws /usr/java/jdk1.7.0_79/jre/bin/javaws --slave /usr/bin/javac javac /usr/java/jdk1.7.0_79/bin/javac --slave /usr/bin/jar jar /usr/java/jdk1.7.0_79/bin/jar --slave /usr/bin/keytool keytool /usr/java/jdk1.7.0_79/bin/keytool --slave /usr/bin/rmiregistry rmiregistry /usr/java/jdk1.7.0_79/bin/rmiregistry && alternatives --set java /usr/java/jdk1.7.0_79/bin/java && rm -f /root/jdk-8u45-linux-x64.rpm
ENV JAVA_HOME /usr/java/jdk1.7.0_79

# Install Android SDK
# Install tools used to install android sdk
RUN yum -y install wget tar expect
# Install 32-bit libs
RUN yum -y install zlib.i686 libstdc++.i686 glibc.i686
RUN cd /opt && wget --output-document=android-sdk.tgz --quiet https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar xzf android-sdk.tgz && rm -f android-sdk.tgz && chown -R root:root android-sdk-linux
ENV PATH ${PATH}:/opt/android-sdk-linux/tools:/opt/android-sdk-linux/platform-tools
COPY tools /opt/tools
# Install Android Build Tools + Support Library to build the starter app
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk -u -a -t tools"]
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk -u -a -t platform-tools"]
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk -u -a -t build-tools-23.0.0"]
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk -u -a -t extra-android-m2repository"]
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk -u -a -t extra-android-support"]
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk -u -a -t android-22"]
RUN adb version
RUN android list sdk
ENV ANDROID_HOME /opt/android-sdk-linux

# GO to workspace
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace

COPY startup.sh /usr/local/bin/startup.sh
CMD bash -C '/usr/local/bin/startup.sh';'bash'
