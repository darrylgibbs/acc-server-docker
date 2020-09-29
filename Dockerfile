FROM ubuntu:latest

RUN apt-get install apt-transport-https -y \
  && dpkg --add-architecture i386 \
  && apt-get update \
#	&& apt-get upgrade -y \
  && apt-get install wine-development -y \
  && apt-get install wine32-development -y \
  && mkdir /home/acc

# to copy all files INTO the container
# COPY . /home/acc 

WORKDIR /home/acc

VOLUME /home/acc

EXPOSE 9600/udp 9600/tcp

CMD ["wine", "./accServer.exe"]