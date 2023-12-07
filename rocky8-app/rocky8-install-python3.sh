#!/bin/bash

dnf update -y
sudo dnf install python3 -y
python -V
alternatives --config python

#References: https://phoenixnap.com/kb/rocky-linux-python
