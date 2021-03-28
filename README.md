# My Home - CCTV

Garage project for **private purposes**.
Describes setup of "self-made" smart cameras in my home.


## Ready, ...


### Prepare the hardware, pt. 1 🧰

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


### Prepare the software, pt. 1

1. Connect the Micro SD card to the computer
2. Download, install, and run **Raspberry Pi Imager**:
	* Tested with v1.6 on Windows
	* Choose OS: Raspberry Pi OS (other) -> **Raspberry Pi OS Lite (32-bit)**
	* Write to the Micro SD card


### Prepare the software, pt. 2

1. Clone this repository
2. Enable SSH & WiFi:
	* It may be required to eject and re-insert the SD card
	1. Open a file explorer, navigate to the drive called **"boot"**
	2. Open another file explorer, navigate to the cloned repo folder
	2. Replace the WiFi password inside the cloned `SD_card/wpa_supplicant.conf` file
	2. Copy all items from cloned the `SD_card/` folder to the SD card's root folder


### Prepare the software, pt. 3

1. Eject the Micro SD card from the computer
2. Insert the Micro SD card into the Ras Pi, connect the power supply; the Ras Pi will automatically start
2. Register the Ras Pi under a proper host name in your router, e.g. *"my-home-cctv-aviary"*
2. Initially connect via SSH: `ssh pi@my-home-cctv-XYZ`
	* There will be a prompt to add the fingerprint, type `yes`
	* The default credentials for any Ras Pi are `pi` (user) and `raspberry` (password)
	* Close the SSH connection


### Prepare the hardware, pt. 2 🧰

Calibrate the IR LEDs by following [this (German) manual](https://github.com/MakeMagazinDE/Nistkasten-V2/blob/main/Hinweise/Problembehebung.md).


## ...steady, ...

1. Create file/folder structure: `ssh pi@my-home-cctv-XYZ 'bash -s' < ./prepare.sh`
2. Copy relevant files to the Ras Pi: `scp -r ./opt/my-home-cctv/ pi@my-home-cctv-XYZ:/opt/`
2. Configure Ras Pi: `ssh pi@my-home-cctv-XYZ 'bash -s' < ./configure.sh`
2. Install *my-home-cctv* dependencies (Mind: The Ras Pi will automatically restart after this step): `ssh pi@my-home-cctv-XYZ 'bash -s' < ./install.sh`
2. Setup cron jobs for *my-home-cctv*:
	1. Connect via SSH again: `ssh pi@my-home-cctv-XYZ`
	2. Start `crontab -e`, select `/bin/nano` as your editor if prompted
	3. Jump to the end of the file by pressing CTRL+END, and enter the following content:
```
# Auto-start `my-home-cctv` on each boot
@reboot /opt/my-home-cctv/get.sh && /opt/my-home-cctv/start.sh

# Reboot weekly at Saturday 3:30am
30 3 * * 6 sudo shutdown -r 0
```
*
	4. Leave the editor by pressing STRG+X, then Y, then ENTER
	5. Restart the Ras Pi: `sudo shutdown -r 0`


## ...go! 🏃‍♂️ 🏃‍♀️

Done!
Now an RTSP video stream is available at `rtsp://my-home-cctv-XYZ:8554/unicast`


## Sources

* [GitHub: IanStorm/my-smart-home-ras-pi](https://github.com/IanStorm/my-smart-home-ras-pi)
* [The official Raspberry Pi documentation](https://projects.raspberrypi.org/en/projects/raspberry-pi-getting-started)
* [How To Setup Ras Pi WiFi](https://core-electronics.com.au/tutorials/raspberry-pi-zerow-headless-wifi-setup.html)
* [How to enable RasPi cam without raspi-config](https://raspberrypi.stackexchange.com/a/29972)
* [How to disable BT](https://di-marco.net/blog/it/2020-04-18-tips-disabling_bluetooth_on_raspberry_pi/#add-below-save-and-close-the-file)
* [Crontab man page](https://linux.die.net/man/5/crontab)
* [GitHub: mpromonet/v4l2rtspserver](https://github.com/mpromonet/v4l2rtspserver)
