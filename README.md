# My Home - CCTV

Garage project for **private purposes**.
Describes setup of "self-made" smart cameras in my home.


## Ready, ...


### Prepare the hardware, pt. 1 🧰 1️⃣

Be sure to call the following hardware your own:

* Temporary, i.e. only for setup:
	* A computer to run the [Rasperry Pi Imager](https://www.raspberrypi.org/downloads/) software
	* ...with a mouse, keyboard, display, etc.
	* ...with an SD card reader
* Permanent, i.e. dedicated to the CCTV setup:
	* 1x Raspberry Pi *(here: Raspberry Pi Zero W)*
	* 1x Micro SD card *(here: SanDisk Ultra 16GB)*
	* 1x Power supply, Pi-compatible 🔌
	* 1x IR camera, Pi-compatible 📷 *(here: Waveshare RPi Camera (F))*
	* 1x Cable: Pi<->Camera *(here: RPi Zero V1.3 Camera Cable)*
	* WiFi access 📡


### Prepare the software, pt. 1 🦙 1️⃣

1. Download and unzip the [latest version of **motionEyeOS** from GitHub](https://github.com/ccrisan/motioneyeos/releases/latest) *(here: v20200606)*
	* for *Pi Zero* pick the plain Ras Pi image, i.e. `motioneyeos-raspberrypi-VERSION.img.xz`
	* don't pick the one for Pi 2, Pi 3, or Pi 4
2. Connect the Micro SD card to the computer
2. Download, install, and run **Raspberry Pi Imager**:
	* Tested with v1.6 on Windows
	* Choose OS: Custom Image -> pick the previously downloaded `.img` file
	* Write to the Micro SD card


### Prepare the software, pt. 2 🦙 2️⃣

1. Clone this repository
2. Enable WiFi:
	* on *motionEyeOS* SSH is enabled per default
	1. Eject and re-insert the SD card
	2. Open a file explorer, navigate to the drive called **"boot"**
	2. Open another file explorer, navigate to the cloned repo folder
	2. Replace the WiFi password inside the cloned `SD_card/wpa_supplicant.conf` file
	2. Copy all items from cloned the `SD_card/` folder to the SD card's root folder


### Prepare the software, pt. 3 🦙 3️⃣

1. Eject the Micro SD card from the computer
2. Insert the Micro SD card into the Ras Pi, connect the power supply; the Ras Pi will automatically start
2. Register the Ras Pi under a proper host name in your router, e.g. *"my-home-cctv-aviary"*
2. Initially connect via SSH: `ssh pi@my-home-cctv-XYZ`
	* There will be a prompt to add the fingerprint, type `yes`
	* The default credentials for *motionEyeOS* are `admin` (user) and empty password
	* Close the SSH connection


### Prepare the hardware, pt. 2 🧰 2️⃣

Calibrate the IR LEDs by following [this (German) manual](https://github.com/MakeMagazinDE/Nistkasten-V2/blob/main/Hinweise/Problembehebung.md).


## ...steady, ...

...


## ...go! 🏃‍♂️ 🏃‍♀️

Done!
Now the web interface is available at `http://my-home-cctv-XYZ`.


## Sources 📙

* [GH IanStorm/my-smart-home-ras-pi](https://github.com/IanStorm/my-smart-home-ras-pi)
* [The official Raspberry Pi documentation](https://projects.raspberrypi.org/en/projects/raspberry-pi-getting-started)
* [How To Setup Ras Pi WiFi](https://core-electronics.com.au/tutorials/raspberry-pi-zerow-headless-wifi-setup.html)
* [Pi Zero with motionEyeOS](https://www.raspberrypi-spy.co.uk/2017/04/raspberry-pi-zero-w-cctv-camera-with-motioneyeos)
* [GH ccrisan/motioneyeos](https://github.com/ccrisan/motioneyeos)
* [How to enable RasPi cam without raspi-config](https://raspberrypi.stackexchange.com/a/29972)
* [How to disable BT](https://di-marco.net/blog/it/2020-04-18-tips-disabling_bluetooth_on_raspberry_pi/#add-below-save-and-close-the-file)
* https://electreeks.de/project/rpi-nistkasten-infrarot-kamera-anleitung/
* https://electreeks.de/raspberry-pi-kamera-installieren-anschliessen/
