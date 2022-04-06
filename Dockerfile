FROM ubuntu:18.04
RUN apt update && \
    apt install -y default-jdk tomcat9 maven git && \
    git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package && \
    cd target && \
    cp hello-1.0.war /var/lib/tomcat9/webapps
CMD ["/var/lib/tomcat9/webapps/hello-1.0.war", "run"]
