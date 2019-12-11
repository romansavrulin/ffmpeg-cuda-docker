# NVIDIA accelerated ffmpeg with docker 19.x

[![Build Status](https://travis-ci.org/romansavrulin/ffmpeg-cuda-docker.svg?branch=master)](https://travis-ci.org/romansavrulin/ffmpeg-cuda-docker)
[![Dockerhub link](https://img.shields.io/badge/hosted-dockerhub-22b8eb.svg)](https://hub.docker.com/r/willprice/nvidia-ffmpeg/)

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

## Usage