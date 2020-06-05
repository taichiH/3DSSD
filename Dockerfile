FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu18.04
LABEL maintainer "taichiH <azumade.30@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install\
    git \
    curl \
    build-essential \
    python3 \
    python3-pip \
    tmux \
    emacs \
    gcc-5 \
    g++-5 \
    libboost-all-dev

RUN mkdir /ws && \
    cd /ws &&\
    git clone https://github.com/taichiH/3DSSD &&\
    cd 3DSSD&& \
    pip3 install -r requirements.txt &&\
    bash download-tensorflow.sh &&\
    pip3 install tensorflow-1.4.0-cp36-cp36m-linux_x86_64.whl

RUN cp /usr/local/cuda-9.0/targets/x86_64-linux/lib/stubs/libcuda.so /usr/local/cuda-9.0/targets/x86_64-linux/lib/libcuda.so.1
RUN ldconfig
RUN echo "export PYTHONPATH=$PYTHONPATH:/path/to/3DSSD/lib:/path/to/3DSSD/mayavi" >> ~/.bashrc

RUN cd /ws/3DSSD && \
    bash compile_all.sh /usr/local/lib/python3.6/dist-packages/tensorflow /usr/local/cuda-9.0

CMD ["bash"]