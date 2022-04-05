FROM maven:3.6.3-jdk-8-openj9
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    cd boxfuse-sample-java-war-hello/ && \
    mvn package && \
    cp target/hello-1.0.war /var/lib/tomcat9/webapps/