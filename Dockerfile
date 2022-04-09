FROM nvidia/cuda:11.6.0-base-ubuntu20.04
RUN apt update && apt install -y ffmpeg
RUN mkdir /ffmpeg

WORKDIR /workspace
ENTRYPOINT ["/usr/bin/ffmpeg"]
CMD ["-h"]
