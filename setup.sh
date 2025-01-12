#!/bin/bash

set -e

# Copying SJ201 firmware and scripts
echo "Copying SJ201 firmware and scripts..."
cp mark2-hardware/sj201/xvf3510-flash /opt/mark2-hardware/sj201/xvf3510-flash
cp mark2-hardware/sj201/app_xvf3510_int_spi_boot_v4_2_0.bin /opt/mark2-hardware/sj201/app_xvf3510_int_spi_boot_v4_2_0.bin
cp mark2-hardware/sj201/init_tas5806.py /opt/mark2-hardware/sj201/init_tas5806.py
chmod 0755 /opt/mark2-hardware/sj201/*

# Enable mark2-hardware systemd unit
echo "Copying mark2-hardware systemd unit file..."
cp mark2-hardware/mark2-hardware.service /etc/systemd/system/mark2-hardware.service
chmod 0644 /etc/systemd/system/mark2-hardware.service

# Enable mark2-hardware systemd unit
echo "Enabling mark2-hardware systemd unit..."
systemctl daemon-reload
systemctl enable mark2-hardware.service
#systemctl --user start mark2-hardware.service

# Test and configure sound
echo "Testing and configuring sound..."
aplay -l
arecord -l

# Finish
echo "Setup for Mark II hardware on Raspbian complete. Please reboot the system."
echo "Rebooting can take a while first time as the drivers are being build and flashed."

