FROM rengarajang/jdk11
RUN mkdir /app
ADD .m2/repository/org/springframework/java-springboot-demo/1.0.0/java-springboot-demo-1.0.0.jar /app/
WORKDIR /app
CMD "java" "-jar" "java-springboot-demo-1.0.0.jar"
EXPOSE 8080
