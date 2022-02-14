FROM rengarajang/jdk11
RUN mkdir /app
COPY /var/jenkins_home/.m2/repository/org/springframework/java-springboot-demo/1.0.0/java-springboot-demo-1.0.0.jar /app/java-springboot-demo-1.0.0.jar
WORKDIR /app
CMD "java" "-jar" "java-springboot-demo-1.0.0.jar"
EXPOSE 8080
