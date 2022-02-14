FROM rengarajang/jdk11
RUN mkdir /app
COPY /var/jenkins_home/workspace/cidemo/complete/target/java-springboot-demo-1.0.0.jar /app/
WORKDIR /app
CMD "java" "-jar" "java-springboot-demo-1.0.0.jar"
EXPOSE 8080
