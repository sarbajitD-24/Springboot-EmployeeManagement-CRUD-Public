FROM ubuntu:18.04
WORKDIR /opt/java
ADD openlogic-openjdk-11.0.19+7-linux-x64.tar.gz .
ENV JAVA_HOME /opt/java/openlogic-openjdk-11.0.19+7-linux-x64
ENV PATH $PATH:$JAVA_HOME/bin
WORKDIR /opt/tomcat
ADD apache-tomcat-9.0.78.tar.gz .
COPY tomcat-resources/tomcat-users.xml /opt/tomcat/apache-tomcat-9.0.78/conf/
COPY tomcat-resources/context.xml /opt/tomcat/apache-tomcat-9.0.78/webapps/manager/META-INF/
COPY target/EmployeeManagement.war /opt/tomcat/apache-tomcat-9.0.78/webapps/
EXPOSE 8080
CMD ["/opt/tomcat/apache-tomcat-9.0.78/bin/catalina.sh", "run"]
