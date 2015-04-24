FROM centos:7
MAINTAINER Bjorn Stange <bjorn248@gmail.com>

# Install Oracle Java 8
# Make sure to download the RPM and change any filenames as appropriate
COPY jdk-8u45-linux-x64.rpm /root/jdk-8u45-linux-x64.rpm
RUN rpm -Uvh /root/jdk-8u45-linux-x64.rpm && alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_45/bin/java 200000 --slave /usr/bin/javaws javaws /usr/java/jdk1.8.0_45/jre/bin/javaws --slave /usr/bin/javac javac /usr/java/jdk1.8.0_45/bin/javac --slave /usr/bin/jar jar /usr/java/jdk1.8.0_45/bin/jar --slave /usr/bin/keytool keytool /usr/java/jdk1.8.0_45/bin/keytool --slave /usr/bin/rmiregistry rmiregistry /usr/java/jdk1.8.0_45/bin/rmiregistry && alternatives --set java /usr/java/jdk1.8.0_45/bin/java && rm -f /root/jdk-8u45-linux-x64.rpm
ENV JAVA_HOME /usr/java/jdk1.8.0_45

# Install Android SDK
# Install tools used to install android sdk
RUN yum -y install wget tar expect
# Install 32-bit libs
RUN yum -y install zlib.i686 libstdc++.i686 glibc.i686
RUN cd /opt && wget --output-document=android-sdk.tgz --quiet http://dl.google.com/android/android-sdk_r24.1.2-linux.tgz && tar xzf android-sdk.tgz && rm -f android-sdk.tgz && chown -R root:root android-sdk-linux
ENV PATH ${PATH}:/opt/android-sdk-linux/tools:/opt/android-sdk-linux/platform-tools
COPY tools /opt/tools
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk -u -a -t 1,2,3"]
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk -u -a -t 22"]
RUN ["/opt/tools/android-accept-licenses.sh", "android update sdk -u -a -t 126"]
RUN which adb
RUN which android
ENV ANDROID_HOME /opt/android-sdk-linux

# GO to workspace
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace

COPY startup.sh /usr/local/bin/startup.sh
CMD bash -C '/usr/local/bin/startup.sh';'bash'
