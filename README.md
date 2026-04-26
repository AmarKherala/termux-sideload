### Requirements:
- An Idevice (obviusly)
- An Android device with OTG support
- An USBC to Lighting cable or an USBC to USBC cable (just find a way to connect the devices goddamit)

### Setting up your android device:
Simply. Install both [termux](https://github.com/termux/termux-app/releases/download/v0.118.3/termux-app_v0.118.3+github-debug_arm64-v8a.apk) and [termux-api](https://github.com/termux/termux-api/releases/download/v0.53.0/termux-api-app_v0.53.0+github.debug.apk) like any other normal Android APK, YOU NEED TO INSTALL BOTH FROM THE SAME LINKS PROVIDED ABOVE.

Install termux-api apk, open it and give it the permissions it needs (ignore batyery optimizations) and (draw over other apps), then install termux.
After you have installed termux, open it, then run this command inside termux:
```
pkg update && pkg install wget
```
Wait for the proccess to finish then run:
```
wget https://github.com/AmarKherala/termux-sideload/releases/download/script/setup.sh && chmod +x setup.sh && ./setup.sh
```

You should now have every package needed to procced with the sideloading proccess.

### Sideloading sidestore:

1. Connect your phone with the iDevice using any cable you got, open termux and run ``usbmuxd &``. If it the iDevice shows a popup asking for permission click ``trust`` or whatever it says to give it perms. Now it should say something like **usbmuxd running. Click Ctrl+c to stop**.

2. Now you can sideload! grab the sidestore ipa by running:
```
wget https://github.com/SideStore/SideStore/releases/download/0.6.2/SideStore.ipa && sideloader install SideStore.ipa -i
```
It will ask you for your Apple ID and password, enter them and the ipa will start installing on your iDevive.

Once thats done you can choose one of the two paths:
- [Sideload only amethyst and stikdebug](aamconly.md)
- [Sideload LiveContainer and stikdebug](lc.md)
