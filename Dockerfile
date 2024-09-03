FROM maven:3.8.7 as build
COPY . .
RUN mvn -B clean package -DskipTests

FROM openjdk:17
COPY --from=build target/*.jar my_app.jar
ENTRYPOINT ["java", "-jar","-Dserver.port=8080","my_app.jar"]