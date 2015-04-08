FROM centos:centos7

MAINTAINER Song Young-Jin <myevan80@gmail.com>

RUN yum -y install wget
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jre-8u31-linux-x64.rpm 
RUN rpm -Uvh jre-8u31-linux-x64.rpm
RUN rm -rf jre-8u31-linux-x64.rpm

RUN yum -y install tar
RUN wget -qO- http://download.jetbrains.com/teamcity/TeamCity-9.0.3.tar.gz | tar xz -C /opt

RUN wget http://dl.google.com/android/ndk/android-ndk-r10d-linux-x86_64.bin
RUN chmod +x android-ndk-r10d-linux-x86_64.bin
RUN ./android-ndk-r10d-linux-x86_64.bin
RUN mv ./android-ndk-r10d /opt/android-ndk-r10d
RUN rm -rf ./android-ndk-r10d-linux-x86_64.bin

RUN wget -qO- http://dl.google.com/android/android-sdk_r24.1.2-linux.tgz | tar xz -C /opt
RUN echo "y" | /opt/android-sdk-linux/tools/android update sdk -u --filter android-15

VOLUME  ["/data/teamcity"]
ENV TEAMCITY_DATA_PATH /data/teamcity

EXPOSE 8111
CMD /opt/TeamCity/bin/teamcity-server.sh start && /opt/TeamCity/buildAgent/bin/agent.sh run
