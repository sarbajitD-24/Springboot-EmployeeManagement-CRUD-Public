#FROM ubuntu:18.04
#WORKDIR /opt/java
#ADD openlogic-openjdk-11.0.19+7-linux-x64.tar.gz .
#ENV JAVA_HOME /opt/java/openlogic-openjdk-11.0.19+7-linux-x64
#ENV PATH $PATH:$JAVA_HOME/bin
#WORKDIR /opt/tomcat
#ADD apache-tomcat-9.0.78.tar.gz .
FROM tomcat:9.0.78-jdk11
COPY tomcat-resources/tomcat-users.xml /usr/local/tomcat/conf/
#COPY tomcat-resources/context.xml /opt/tomcat/apache-tomcat-9.0.78/webapps/manager/META-INF/
COPY target/EmployeeManagement.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/opt/tomcat/apache-tomcat-9.0.78/bin/catalina.sh", "run"]
