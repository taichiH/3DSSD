#!/bin/bash

DATASET_DIR=${HOME}/vision/3DSSD/dataset
DATA_DIR=${HOME}/vision/3DSSD/data
PRETRAINED_MODEL_DIR=${HOME}/vision/3DSSD/pretrained_model

sudo docker run \
     -it \
     --gpus all \
     --shm-size=256mb \
     -e DISPLAY=unix$DISPLAY \
     -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
     -v ${DATASET_DIR}:/ws/3DSSD/dataset \
     -v ${DATA_DIR}:/ws/3DSSD/data \
     -v ${PRETRAINED_MODEL_DIR}:/ws/3DSSD/pretrained_model \
     taichi-h:3dssd
