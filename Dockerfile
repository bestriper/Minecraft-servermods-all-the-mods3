FROM openjdk:alpine 
MAINTAINER bestriper <bestriper@gmail.com> 

USER root 
WORKDIR /minecraft

VOLUME ["/minecraft/world"]
EXPOSE 25565 
RUN apk update && apk add curl bash

# Download and unzip minecraft files 
RUN mkdir -p /minecraft/world

RUN curl -LO https://media.forgecdn.net/files/2583/634/serverfiles.zip
RUN unzip serverfiles.zip
RUN rm serverfiles.zip

# Accept EULA 
RUN echo "# EULA accepted on $(date)" > /minecraft/eula.txt && \
    echo "eula=TRUE" >> eula.txt

# Startup script 
CMD ["/bin/bash", "/minecraft/ServerStart.sh"] 