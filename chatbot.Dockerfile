# use chatbot base
#FROM chatbot-base:latest

FROM samplecontainer8899.azurecr.io/chatbot-base:latest

# Optionally, copy your application JAR or WAR file into the container
COPY ./app /usr/local/tomcat/webapps

