# Use an official Ubuntu base image
FROM debian:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install F2FS tools and other dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    f2fs-tools \
    util-linux \
    git f2fs-tools debootstrap systemd-container pv \
    qemu-user-static binfmt-support initramfs-tools-core curl zstd \
    && rm -rf /var/lib/apt/lists/*

RUN git config --global http.sslverify false

RUN git clone https://github.com/wally4000/PyraBuild /home
# Entry point (you can change this to run your specific tests or scripts)
ENTRYPOINT ["/bin/bash"]
