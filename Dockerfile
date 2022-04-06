FROM ubuntu:18.04
RUN apt update && \
    apt install -y default-jdk maven git wget && \
    cd /var/java_app && \
    wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.20/bin/apache-tomcat-10.0.20.tar.gz && \
    tar -zxf apache-tomcat-10.0.20.tar.gz - C /var/java_app && \
    cd /var/java_app/apache-tomcat-10.0.20/bin
CMD ["/var/java_app/apache-tomcat-10.0.20/bin/catalina.sh", "run"]
WORKDIR /data
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    cd /data/boxfuse-sample-java-war-hello && \
    mvn package && \
    cd target && \
    cp hello-1.0.war ~/apache-tomcat-10.0.20/webapps