FROM maven
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    cd boxfuse-sample-java-war-hello/ && \
    mvn package \
    cp target/hello-1.0.war /var/lib/tomcat9/webapps/