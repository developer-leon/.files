#!/bin/sh

cat << EOF | sudo tee -a /etc/hosts

#########################
# V
192.168.10.10 app.dev
EOF
