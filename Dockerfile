FROM ubuntu:18.04
RUN apt update && \
    apt install -y default-jdk maven git && \
    wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.20/bin/apache-tomcat-10.0.20.tar.gz && \
    tar -zxf apache-tomcat-10.0.20.tar.gz && \
    cd apache-tomcat-10.0.20/bin
CMD ["catalina.sh", "run"]
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package && \
    cd target && \
    cp hello-1.0.war /var/lib/tomcat9/webapps
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]