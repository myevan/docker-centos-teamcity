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
RUN yum -y install glibc.i686 glibc-devel.i686 zlib-devel.i686 ncurses-devel.i686 libX11-devel.i686 libXrender.i686 libXrandr.i686

RUN wget -qO- http://apache.mirror.cdnetworks.com//ant/binaries/apache-ant-1.9.4-bin.tar.gz | tar xz -C /opt

RUN wget -qO- --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u72-b14/jdk-7u72-linux-x64.tar.gz" | tar xz -C /opt

RUN echo "y" | /opt/android-sdk-linux/tools/android update sdk -u --filter android-15,platform-tools,build-tools-22.0.1

VOLUME  ["/data/teamcity"]

ENV TEAMCITY_DATA_PATH 	/data/teamcity
ENV ANT_HOME 		/opt/apache-ant-1.9.4
ENV ANDROID_HOME 	/opt/android-sdk-linux
ENV JAVA_HOME		/opt/jdk1.7.0_72
ENV PATH 		$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platforms:$ANT_HOME/bin

EXPOSE 8111
CMD /opt/TeamCity/bin/teamcity-server.sh start && /opt/TeamCity/buildAgent/bin/agent.sh run
