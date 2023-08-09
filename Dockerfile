#FROM ubuntu:18.04
#WORKDIR /opt/java
#ADD openlogic-openjdk-11.0.19+7-linux-x64.tar.gz .
#ENV JAVA_HOME /opt/java/openlogic-openjdk-11.0.19+7-linux-x64
#ENV PATH $PATH:$JAVA_HOME/bin
#WORKDIR /opt/tomcat
#ADD apache-tomcat-9.0.78.tar.gz .
FROM tomcat:9.0.78-jdk11
RUN ["cp", "-R", "/usr/local/tomcat/webapps.dist/docs", "/usr/local/tomcat/webapps/"]
RUN ["cp", "-R", "/usr/local/tomcat/webapps.dist/examples", "/usr/local/tomcat/webapps/"]
RUN ["cp", "-R", "/usr/local/tomcat/webapps.dist/host-manager", "/usr/local/tomcat/webapps/"]
RUN ["cp", "-R", "/usr/local/tomcat/webapps.dist/manager", "/usr/local/tomcat/webapps/"]
RUN ["cp", "-R", "/usr/local/tomcat/webapps.dist/ROOT", "/usr/local/tomcat/webapps/"]
RUN ["rm", "-rf", "/usr/local/tomcat/webapps.dist/"]
COPY tomcat-resources/tomcat-users.xml /usr/local/tomcat/conf/
COPY tomcat-resources/context.xml /usr/local/tomcat/webapps/manager/META-INF/
COPY SampleWebApp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
