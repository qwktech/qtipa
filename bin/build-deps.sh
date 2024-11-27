#!/bin/sh

RELEASE=41
TEMP=/tmp/Rpi5boot
GREEN='\033[1;32m'
NC='\033[0m'

echo -e "\n${GREEN}Installing dependencies...${NC}\n"
dnf install -y cpio butane

echo -e "\n${GREEN}Compliing ign file...${NC}\n"
butane --pretty --strict /data/qtipa.bu > /data/qtipa.ign

echo -e "\n${GREEN}Downloading U-Boot RPMs...${NC}\n"
mkdir -p ${TEMP}/boot/efi/
dnf install -y  \
  --downloadonly \
  --release=$RELEASE \
  --forcearch=aarch64 \
  --destdir=${TEMP} \
  uboot-images-armv8 bcm283x-firmware bcm283x-overlays

echo -e "\n${GREEN}Extracting RPMs to .bin...${NC}\n"
for rpm in ${TEMP}/*rpm; do rpm2cpio $rpm | cpio -idv -D ${TEMP}/; done
mv ${TEMP}/usr/share/uboot/rpi_arm64/u-boot.bin ${TEMP}/boot/efi/rpi-u-boot.bin

echo -e "\n${GREEN}DONE!${NC}"
