FROM nvidia/cuda:10.1-base-ubuntu18.04
RUN apt update && apt install -y ffmpeg
RUN mkdir /ffmpeg