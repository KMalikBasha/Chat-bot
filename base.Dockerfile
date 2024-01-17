# Use the official OpenJDK 8 image as the base image
FROM openjdk:8-jdk-alpine

# Set environment variables
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Create a directory for Tomcat
RUN mkdir -p $CATALINA_HOME

# Download and install Apache Tomcat
ARG TOMCAT_VERSION=8.5.98
ADD https://downloads.apache.org/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz /tmp
RUN tar xzf /tmp/apache-tomcat-${TOMCAT_VERSION}.tar.gz -C $CATALINA_HOME --strip-components=1 && \
    rm -f /tmp/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
