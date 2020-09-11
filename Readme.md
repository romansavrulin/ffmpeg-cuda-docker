# NVIDIA accelerated ffmpeg with docker 19.x

[![Build Status](https://travis-ci.org/romansavrulin/ffmpeg-cuda-docker.svg?branch=master)](https://travis-ci.org/romansavrulin/ffmpeg-cuda-docker)
[![Dockerhub link](https://img.shields.io/badge/hosted-dockerhub-22b8eb.svg)](https://hub.docker.com/r/romansavrulin/ffmpeg-cuda)

Inspired by https://github.com/dl-container-registry/ffmpeg

## Features

* [NVENCODE acceleration](https://developer.nvidia.com/nvidia-video-codec-sdk#NVENCFeatures)
* [NVDECODE acceleration](https://developer.nvidia.com/nvidia-video-codec-sdk#NVDECFeatures)
* [video codec: x264](https://www.videolan.org/developers/x264.html)
* [video codec: x265](https://www.videolan.org/developers/x265.html)
* [audio codec: AAC](https://github.com/mstorsjo/fdk-aac)

NVENCODE (nvenc) and NVDECODE (formerly CUVID) are packaged in the [NVIDIA Video Codec
SDK](https://developer.nvidia.com/nvidia-video-codec-sdk).

### Hardware Accelerated Encoders:

List options of an encoder using `ffmpeg -h encoder=XXXX`

* `h264_nvenc`, `nvenc`, `nvenc_h264` 
* `nvenc_hevc`, `hevc_nvenc`

### Hardware Accelerated Decoders:

List options of a decoder using `ffmpeg -h decoder=XXXX`

* `h264_cuvid`
* `hevc_cuvid`
* `mjpeg_cuvid`
* `mpeg1_cuvid`
* `mpeg2_cuvid`
* `mpeg4_cuvid`
* `vc1_cuvid`
* `vp8_cuvid`
* `vp9_cuvid`

### Hardware Accelerated Filters:

List options of a filter using `ffmpeg -h filter=XXXX`

* `hwupload_cuda`
* `scale_cuda`
* `scale_npp`
* `thumnail_cuda`

## Build

```bash
docker build -t ffmpeg .
```

## Usage

Run the container mounting the current directory to `/workspace` processing 
`input.mp4` to `output.mp4` without any hardware acceleration

```bash
docker run --rm -it --gpus all \
    --volume $PWD:/workspace \
    ffmpeg ffmpeg -i input.mp4 output.avi
```

```bash
docker run --rm -it --gpus all \
    --volume $PWD:/workspace \
    ffmpeg ffmpeg \
      -hwaccel_device 0 \
      -hwaccel cuvid \
      -c:v h264_cuvid \
      -i input.mp4 \
      -c:v hevc_nvenc
      out.mkv
```

Get a shell prompt inside the container, useful for debugging:

```bash
docker run --rm -it --gpus all \
    --volume $PWD:/workspace \
    --entrypoint bash
    ffmpeg
```

## Resources

* [FFmpeg hardware acceleration guide with examples](https://trac.ffmpeg.org/wiki/HWAccelIntro)
* [Static FFmpeg build on Ubuntu 16.04 guide](https://gist.github.com/jniltinho/9c009e9771651aa4a004ad3d1f6857e3)
* [Using FFmpeg with GNU parallel](https://gist.github.com/Brainiarc7/18fca697891aea0e879f13ed092cb213)
* [Listing NVENC and NPP capabilities of FFmpeg](https://gist.github.com/Brainiarc7/c6164520f082c27ae7bbea9556d4a3ba)
* [Encoding HEVC using FFmpeg with NVENC](https://gist.github.com/Brainiarc7/8b471ff91319483cdb725f615908286e)
* [FFmpeg cheatsheet](https://gist.github.com/Brainiarc7/ebf3091efd2bf0a0ded0f9715cd43a38)
* [FFmpeg-static build scripts](https://github.com/zimbatm/ffmpeg-static
