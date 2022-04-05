FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

FROM maven:3.6.3-jdk-8-openj9
WORKDIR /app/boxfuse-sample-java-war-hello/
RUN    mvn package && \
       cp target/hello-1.0.war /var/lib/tomcat9/webapps/