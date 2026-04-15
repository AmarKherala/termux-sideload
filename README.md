### Requirements:
- An Idevice (obviusly)
- An Android device with OTG support
- An USBC to Lighting cable or an USBC to USBC cable (just find a way to connect the devices goddamit)

### Setting up your android device:
Simply. Install both [termux](https://github.com/termux/termux-app) and [termux-api](https://github.com/termux/termux-api), YOU NEED TO INSTALL BOTH.

After you have installed termux, run this command:
```
pkg update && pkg install wget
```
Wait for the proccess to finish then run:
```
wget https://github.com/AmarKherala/debs/blob/master/setup.sh && chmod +x setup.sh && ./setup.sh
```

You should now have every package needed to procced with the sideloading proccess.
