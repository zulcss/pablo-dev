FROM debian:testing

# Don't pin the packages versions to exact values
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        mmdebstrap \
        bubblewrap \
        devscripts \
        openssh-client \
        git-buildpackage \
        sbuild \
        dosfstools \
        python3-pip \
        python3-yaml \
        python3-rich \
        python3-stevedore \
        python3-cerberus \
        python3-click \
        python3-gi \
        dosfstools \
        systemd-container \
        ostree \
        libostree-dev \
        gir1.2-glib-2.0 \
        gir1.2-ostree-1.0 \
        libcairo2-dev \
        libgirepository1.0-dev \
        parted \
        fdisk \
        dosfstools \
        parted \
        vim \
        sudo \
        udev \
        systemd-boot \
        gir1.2-ostree-1.0 \
        git && \
        rm -rf /var/lib/apt/lists/*

RUN if [ "$(uname -m)" = "x86_64" ]; then apt update && apt install qemu-user-static arch-test -y; fi

# Extra python installs and configurations
COPY files/pip.conf /etc/pip.conf
RUN pip install omegaconf tox autopep8

# Needed for uefi-ostree
RUN mkdir -p /var/www/html

RUN useradd -ms /bin/bash user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd
USER user

WORKDIR /home/user
