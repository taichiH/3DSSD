#!/bin/bash
curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=142fwmiq8skVUcEqxXny9zA4bNG7YULGn" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=142fwmiq8skVUcEqxXny9zA4bNG7YULGn" -o tensorflow-1.4.0-cp36-cp36m-linux_x86_64.whl
