# Vinyl on Sonos

This project was born as I started only to listen to streamin music services once I my Sonos system. But I also have a collection of vinyl that I didn't wanted to throw away and keeping the whole old setup was kind of overkill. Unfortunately there isn't such a great offering from Sonos to enable vinyl players as source in the network is rather limited and expensive at the same time the idea was born to reuse a raspi and a USB Audio device to solve this issue.

In my first try I was using a [Raspberry Pi Zero W](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) and a [Behringer UFO202](https://www.behringer.com/behringer/product?modelCode=P0A12) which did work but also had it caveats as the CPU was dramatically overwhelmed with MP3 encoding. So in the meantime I upgraded to a Raspberry Pi 3b+ and also swapped the Behringer device with a proper high quality Phono PreAmp – the [rega Fono Mini A2D mk2](http://www.rega.co.uk/fono-mini-a2d.html).

Additionally with this switch I wanted to optimize the setup and also switch to a docker based setup. tl;dr: this actually works like a charm now but also has a couple of problems:

- the container is rather huge as I based it on the `balenalib/raspberry-pi3-debian:buster-run` image
- it runs 2 processes in the same container as icecast2 is started as a service
- there is very likely a ton of things brought in with the debian package of `liquidsoap` than actually needed
- default passes haven't been changed yet – look at the [Dockerfile](Dockerfile) it is way too simple to sort these things out
