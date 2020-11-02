FROM balenalib/raspberrypi3-debian:buster-run

EXPOSE 8000
RUN install_packages icecast2 liquidsoap && \
    chsh -s /bin/bash liquidsoap  

CMD service icecast2 start && \
    su liquidsoap -c "liquidsoap 'output.icecast(%mp3(bitrate=320), host=\"localhost\", port=8000, password=\"hackme\", mount=\"phono\", input.alsa(bufferize=true,fallible=false,device=\"hw:1,0\"))'"
