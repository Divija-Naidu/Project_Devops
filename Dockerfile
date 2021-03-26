FROM maven:3.6.0-jdk-11-slim AS build
COPY src /var/lib/jenkins/workspace/Docker_Jenkins/src
COPY pom.xml /var/lib/jenkins/workspace/Docker_Jenkins
RUN mvn -f /var/lib/jenkins/workspace/Docker_Jenkins/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /var/lib/jenkins/workspace/Docker_Jenkins/target/javaparser-maven-sample-1.0-SNAPSHOT.jar /usr/local/lib/javaparser-maven-sample-1.0.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/javaparser-maven-sample-1.0.jar"]
