# Simple Dockerfile to package a Tomcat webapp
FROM tomcat:10.1-jdk17-temurin

# Copy custom web application
COPY ./webapps /usr/local/tomcat/webapps

# Expose default Tomcat port
EXPOSE 8080

# Default command is provided by parent image (catalina.sh run)
