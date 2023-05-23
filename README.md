# syncos
SyncOS is an operating system based on Armbian, specifically designed for rk322x, with a focus on optimization. It does not have a graphical interface and is intended solely for server mode.

_Attention this project is still under constant development, this entire guide may be changed._


## Overview
- [x] Server Mode
- [x] Integrated
- [x] Portable
- [x] High-Performance
- [x] Armbian based
- [X] Command Line Interface

## Target

```lua
SyncOS -- Remote Controled (WebServer)
  |
  PyFirmata Daemon
          |
          +-- ARDUINO Board
```
## Basic requirements
- [x] Ubuntu Jammy 22.04.x amd64 or aarch64 for native building or any Docker capable amd64 / aarch64 Linux for containerised
- [x] Advanced knowledge of Linux.

## Get started
Build minimal CLI Armbian Focal image for rk322x. Use modern kernel and write image to the SD card:<br>
For complete reference: https://github.com/armbian/build
<br>rk322x Template
```sh
# RK322X TVBox quad core 1GB/2GB DDR2/DDR3 eMMC/NAND SoC FE WiFi
BOARD_NAME="rk322x-box"
BOARDFAMILY="rk322x"
BOOTCONFIG="rk322x-box_defconfig"
BOOT_FDT_FILE="rk322x-box.dtb"
MODULES_LEGACY="hci_uart rfcomm hidp"
MODULES_BLACKLIST_LEGACY="ssv6051 8723cs r8188eu ssv6x5x"
KERNEL_TARGET="legacy,current,edge"
```
Basics parameters usage
```sh
./compile.sh \
BOARD=rk322x \
BRANCH=current \
RELEASE=focal \
BUILD_MINIMAL=yes \
BUILD_DESKTOP=no \
KERNEL_ONLY=no \
KERNEL_CONFIGURE=no \
CARD_DEVICE="/dev/sdXXXX"
```
