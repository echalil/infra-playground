#!/usr/bin/env bash
[ $# -eq 0 ] && { echo "Usage: $0 <CIDR>"; exit 1; }
ipcalc "$1"