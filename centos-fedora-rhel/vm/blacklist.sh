#!/bin/bash


######### Blacklist modules #########
tee /etc/modprobe.d/blacklist.conf <<-'EOF'
blacklist intel_rapl
blacklist i2c_piix4
EOF

