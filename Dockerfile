FROM docker.io/debian:11-slim

EXPOSE 8000

RUN apt update && \
    apt install -y icecast2 liquidsoap && \
    chsh -s /bin/sh liquidsoap

CMD service icecast2 start && \
    su liquidsoap -c "liquidsoap 'output.icecast(%mp3(bitrate=320), host=\"localhost\", port=8000, password=\"hackme\", mount=\"phono\", input.alsa(bufferize=true,fallible=false,device=\"default\"))'"
