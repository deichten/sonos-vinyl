# Vinyl on Sonos

This project was born as I started only to listen to streamin music services once I my Sonos system. But I also have a collection of vinyl that I didn't wanted to throw away and keeping the whole old setup was kind of overkill. Unfortunately there isn't such a great offering from Sonos to enable vinyl players as source in the network is rather limited and expensive at the same time the idea was born to reuse a raspi and a USB Audio device to solve this issue.

In my first try I was using a [Raspberry Pi Zero W](https://www.raspberrypi.org/products/raspberry-pi-zero-w/) and a [Behringer UFO202](https://www.behringer.com/behringer/product?modelCode=P0A12) which did work but also had it caveats as the CPU was dramatically overwhelmed with MP3 encoding. So in the meantime I upgraded to a Raspberry Pi 3b+ and also swapped the Behringer device with a proper high quality Phono PreAmp – the [rega Fono Mini A2D mk2](http://www.rega.co.uk/fono-mini-a2d.html).

Additionally with this switch I wanted to optimize the setup and also switch to a docker based setup. tl;dr: this actually works like a charm now but also has a couple of problems:

- the container is rather huge as I based it on the `balenalib/raspberry-pi3-debian:buster-run` image
- it runs 2 processes in the same container as icecast2 is started as a service
- there is very likely a ton of things brought in with the debian package of `liquidsoap` than actually needed
- default passes haven't been changed yet – look at the [Dockerfile](Dockerfile) it is way too simple to sort these things out
- the input and encoding are hardcoded in the liquidsoap call starting the process to the first subsystem of the first input

## running the service
Starting this thingy is actually as easy as calling:

```
$ docker run --name sonos_vinyl --rm -d -p 8000:8000 --device /dev/snd quay.io/deichten/sonos-vinyl-arm
```

Where the name is absolutely optional and I only added for readability. Afterwards you might open `http://<your-raspi-docker-host-address>:8000/` in your browser and start streaming the audio input. 

## Pro Tip
As this repo is setup to build a new container version via github actions I also run [containrrr/watchtower](https://github.com/containrrr/watchtower) to keep the version always up to date on my Raspi.
