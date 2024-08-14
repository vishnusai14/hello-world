FROM openjdk:11 AS BUILD_IMAGE
RUN apt update && apt install maven -y
WORKDIR /app
COPY . /app/
RUN mvn clean install 

FROM tomcat:9.0.93-jre11-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=BUILD_IMAGE /app/webapp/target/webapp.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]

