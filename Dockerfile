FROM alpine/git as clone
ARG url
WORKDIR /app
RUN git clone https://github.com/Divija-Naidu/Project_Devops.git

FROM maven:3.5-jdk-8-alpine as build
ARG project
WORKDIR /app
COPY --from=clone /app/Project_Devops /app
RUN mvn install

FROM openjdk:8-jre-alpine
ARG artifactid
ARG version
ENV artifact $Project_Devops-1.5.jar
WORKDIR /app
COPY --from=build /app/target/Project_Devops /app
EXPOSE 8080
CMD ["java -jar Project_Devops"]
