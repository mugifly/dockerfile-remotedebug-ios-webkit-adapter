# Dockerfile for remotedebug-ios-webkit-adapter

Dockerized [remotedebug-ios-webkit-adapter](https://github.com/RemoteDebug/remotedebug-ios-webkit-adapter).

Makes it easy to debug with inspector to Mobile Safari from your computer.

NOTE: This Dockerfile is an unofficial project. I have no relationship with author of remotedebug-ios-webkit-adapter project.


----


## Requirements

* iOS or iPad OS device

* PC (Linux):

    * Google Chrome

    * `usbmuxd` daemon (Tested on v1.1.1)
    
        * Ubuntu / Debian: `$ sudo apt-get install -y usbmuxd`
    
        * Arch Linux: `$ sudo pacman -S usbmuxd`


----


## Quick Start

### 1. Enable "Web Inspector" of Mobile Safari
Open the "Settings" of iOS (or iPad OS).
Then, Enable "Web Inspector" on "Safari" -> "Detail" section.

### 2. Start `usbmuxd` daemon on PC
```
$ sudo systemctl start usbmuxd
```

### 3. Connect iOS (or iPad OS) device to PC

### 4. Trust your PC on iOS (or iPad OS) device

### 5. Execute the follwing command on PC
```
$ sudo docker run -it --rm -p=8080:8080 -v /var/run/usbmuxd:/var/run/usbmuxd mugifly/remotedebug-ios-webkit-adapter
```

### 6. Open inspector on PC 

1. Navigate to `chrome://inspect` on Google Chrome.
2. Enable a checkbox of "Discover network targets".
3. Click "Configure..." button. Then, Insert `localhost:8080` to "IP address and port" field. Finally, click "Done" button.
4. Now, tabs on Mobile Safari will appear in the "Remote Target" section of Google Chrome.


----


## Acknowledgments

The built docker image from this Dockerfile contains the following softwares and applied those licenses. Thanks to authors.

* [libplist](https://github.com/libimobiledevice/libplist)
* [libusbmuxd](https://github.com/libimobiledevice/libusbmuxd)
* [libimobiledevice](https://github.com/libimobiledevice/libimobiledevice)
* [usbmuxd](https://github.com/libimobiledevice/usbmuxd)
* [ios-webkit-debug-proxy](https://github.com/google/ios-webkit-debug-proxy)
* [remotedebug-ios-webkit-adapter](https://github.com/RemoteDebug/remotedebug-ios-webkit-adapter)

