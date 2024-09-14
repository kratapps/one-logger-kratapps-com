FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    git \
    python3 \
    python3-pip \
    --no-install-recommends && \
    # Clean up to reduce image size
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --upgrade pip

RUN pip install mkdocs mkdocs-material

EXPOSE 8000

CMD ["bash"]
