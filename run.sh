#!/bin/sh
docker  run --gpus all \
-it -e NVIDIA_DRIVER_CAPABILITIES=video,compute,utility \
-v ${PWD}:/ffmpeg ffmpeg:cuda \
/bin/sh -c 'cd /ffmpeg; ffmpeg -y -vsync 0 -hwaccel cuvid -c:v h264_cuvid -I in.mp4 -c:v hevc_nvenc out.mkv'
