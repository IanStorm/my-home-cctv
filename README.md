# My Home - CCTV

Garage project for **private purposes**.
Describes setup of "self-made" smart cameras in my home.


## Ready, ...


### Prepare the hardware 🧰

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
	* WiFi access


### Prepare the software, pt. 1

Follow the below step-by-step instructions:

1. Connect the Micro SD card to the computer
2. Download, install, and run **Raspberry Pi Imager**:
	* Tested with v1.6 on Windows
	* Choose OS: Raspberry Pi OS (other) -> **Raspberry Pi OS Lite (32-bit)**
	* Write to the Micro SD card
2. Enable SSH & WiFi:
	1. It may be required to eject and re-insert the SD card
	2. Open a file explorer, navigate to the drive called **"boot"**
	2. Create a file called **`ssh`** (no extension, no content) on root level
	2. Create a file called **`wpa_supplicant.conf`** on root level with the following content:
```
country=DE
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
	ssid="UAreOnMyWifiChannel@gmail.com"
	psk="!PWD"
	key_mgmt=WPA-PSK
}
```
4. Eject the Micro SD card from the computer
4. Insert the Micro SD card into the Ras Pi, connect the ethernet cable, connect the power supply; the Ras Pi will automatically start


### Prepare the software, pt. 2

1. Clone this repository.
2. `cd` inside the cloned folder.
2. Register the Ras Pi under a proper host name in your router, e.g. *"my-home-cctv-aviary"*
2. Initially connect via SSH: `ssh pi@my-home-cctv-aviary`
	* There will be a prompt to add the fingerprint, type `yes`
	* The default credentials for any Ras Pi are `pi` (user) and `raspberry` (password)
	* Close the SSH connection


## Sources

* [GitHub: IanStorm/my-smart-home-ras-pi](https://github.com/IanStorm/my-smart-home-ras-pi)
* [The official Raspberry Pi documentation](https://projects.raspberrypi.org/en/projects/raspberry-pi-getting-started)
* [How To Setup Ras Pi WiFi](https://core-electronics.com.au/tutorials/raspberry-pi-zerow-headless-wifi-setup.html)
