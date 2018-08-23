FROM openjdk:alpine 
MAINTAINER bestriper <bestriper@gmail.com> 

USER root 
WORKDIR /minecraft

VOLUME ["/minecraft/world"]
EXPOSE 25565 
RUN apk update && apk add curl bash

# Download and unzip minecraft files 
RUN mkdir -p /minecraft/world

RUN curl -LO https://minecraft.curseforge.com/projects/all-the-mods-3/files/2583634/download
RUN unzip server%20files.zip && mv ATM3/* ./
RUN rmdir ATM3 && rm server%20files.zip

# Accept EULA 
RUN echo "# EULA accepted on $(date)" > /minecraft/eula.txt && \
    echo "eula=TRUE" >> eula.txt

# Startup script 
CMD ["/bin/bash", "/minecraft/ServerStart.sh"] 