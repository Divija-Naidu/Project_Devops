FROM maven:3.6.0-jdk-11-slim AS build
COPY src home/divija/Desktop/MyProject/javaparser-maven-sample/src
COPY pom.xml /home/divija/Desktop/MyProject/javaparser-maven-sample
RUN mvn -f /home/divija/Desktop/MyProject/javaparser-maven-sample/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build home/divija/Desktop/MyProject/javaparser-maven-sample/target/demo-0.0.1-Project_Devops.jar /usr/local/lib/demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
