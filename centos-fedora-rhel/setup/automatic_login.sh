#!/bin/bash
# Automatic login

$user=user

tee /etc/gdm/custom.conf <<- EOF
# GDM configuration storage
[daemon]

AutomaticLoginEnable=true
AutomaticLogin=$user
TimedLoginDelay=5

[security]

[xdmcp]

[greeter]

[chooser]

[debug]

EOF

