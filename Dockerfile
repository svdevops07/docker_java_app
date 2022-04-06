FROM ubuntu:18.04
RUN apt update && \
    apt install -y default-jdk tomcat9 maven git && \
    git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
CMD mvn package
RUN cd target && \
    cp hello-1.0.war /var/lib/tomcat9/webapps \
