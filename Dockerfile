FROM ubuntu:20.04 
MAINTAINER "info@gamutgurus.com"
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
ENV JAVA_HOME /usr
RUN apt-get install -y ssh
RUN useradd -md /home/hari -s /bin/bash hari
ADD apache-tomcat-9.0.85.tar.gz /home/hari/distros
COPY target/gamutgurus.war /home/hari/distros/apache-tomcat-9.0.85/webapps
ENTRYPOINT /home/hari/distros/apache-tomcat-9.0.85/bin/startup.sh && bash

