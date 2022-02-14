# java-springboot-demo


If you are using Maven, execute:

mvn package && java -jar target/gs-spring-boot-0.1.0.jar
You will see a new set of RESTful end points added to the application. These are management services provided by Spring Boot.

2018-03-17 15:42:20.088  ... : Mapped "{[/error],produces=[text/html]}" onto public org.s...
2018-03-17 15:42:20.089  ... : Mapped "{[/error]}" onto public org.springframework.http.R...
2018-03-17 15:42:20.121  ... : Mapped URL path [/webjars/**] onto handler of type [class ...
2018-03-17 15:42:20.121  ... : Mapped URL path [/**] onto handler of type [class org.spri...
2018-03-17 15:42:20.157  ... : Mapped URL path [/**/favicon.ico] onto handler of type [cl...
2018-03-17 15:42:20.488  ... : Mapped "{[/actuator/health],methods=[GET],produces=[application/vnd...
2018-03-17 15:42:20.490  ... : Mapped "{[/actuator/info],methods=[GET],produces=[application/vnd.s...
2018-03-17 15:42:20.491  ... : Mapped "{[/actuator],methods=[GET],produces=[application/vnd.spring...
They include: errors, actuator/health, actuator/info, actuator.

Note
There is also a /actuator/shutdown endpoint, but it’s only visible by default via JMX. To enable it as an HTTP endpoint, add management.endpoints.shutdown.enabled=true to your application.properties file.
It’s easy to check the health of the app.

$ curl localhost:8080/actuator/health
{"status":"UP"}
You can try to invoke shutdown through curl.

$ curl -X POST localhost:8080/actuator/shutdown
{"timestamp":1401820343710,"error":"Method Not Allowed","status":405,"message":"Request method 'POST' not supported"}
Because we didn’t enable it, the request is blocked by the virtue of not existing.

For more details about each of these REST points and how you can tune their settings with an application.properties file (in src/main/resources), you can read detailed docs about the endpoints.
