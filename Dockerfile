FROM tomcat:9.0.93-jre11-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
# COPY /webapp/target/webapp.war /usr/local/tomcat/webapps/ROOT.war

##USE THIS COPY IF WE USE SEPARATE DOCKER NODE
COPY ./webapp.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]