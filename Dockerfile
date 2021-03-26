FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/Divija-Naidu/Project_Devops.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/Project_Devops /app
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/Project_Devops-1.5.1.jar /app
EXPOSE 8080
CMD ["java -jar Project_Devops-1.5.1.jar"]
