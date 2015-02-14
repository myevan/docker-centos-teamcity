FROM centos:centos7

MAINTAINER Song Young-Jin <myevan80@gmail.com>

RUN yum -y install wget
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jre-8u31-linux-x64.rpm 
RUN rpm -Uvh jre-8u31-linux-x64.rpm
RUN rm -rf jre-8u31-linux-x64.rpm

RUN yum -y install tar
RUN wget -qO- http://download.jetbrains.com/teamcity/TeamCity-9.0.2.tar.gz | tar xz -C /opt

VOLUME  ["/data/teamcity"]
ENV TEAMCITY_DATA_PATH /data/teamcity

EXPOSE 8111
CMD /opt/TeamCity/bin/teamcity-server.sh start && /opt/TeamCity/buildAgent/bin/agent.sh run
