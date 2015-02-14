FROM centos:centos7

MAINTAINER Song Young-Jin <myevan80@gmail.com>

RUN yum -y install wget
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jre-8u31-linux-x64.rpm 
RUN rpm -Uvh jre-8u31-linux-x64.rpm
RUN rm -rf jre-8u31-linux-x64.rpm

RUN yum -y install unzip
RUN yum -y install sudo
ADD setup-agent.sh /setup-agent.sh

RUN adduser teamcity

EXPOSE 9090
CMD sudo -u teamcity -s -- sh -c "TEAMCITY_SERVER_PORT=$TEAMCITY_SERVER_PORT TEAMCITY_SERVER=$TEAMCITY_SERVER AGENT_NAME=$AGENT_NAME bash /setup-agent.sh run"
