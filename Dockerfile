ARG BUILD_IMAGE=debian:stretch-slim

FROM ${BUILD_IMAGE} AS builder
LABEL maintainer="ZXTeam <devel@zxteam.org>"
ARG FLUTTER_SDK_VERSION="2.0.5"

# Environment
RUN apt-get update && apt-get install -y curl git unzip xz-utils zip wget && rm -rf /var/lib/apt/lists/*

# Get sources
RUN cd /opt && wget -qO- "https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${FLUTTER_SDK_VERSION}-stable.tar.xz" | tar -xJ

ENV PATH "/opt/flutter/bin:${PATH}"

ENTRYPOINT ["/bin/bash"]