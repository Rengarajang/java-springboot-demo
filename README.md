# java-springboot-demo


If you are using Maven, execute:

mvn package && java -jar target/gs-spring-boot-0.1.0.jar
You will see a new set of RESTful end points added to the application. These are management services provided by Spring Boot.

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
