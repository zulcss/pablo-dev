FROM debian:testing

# Don't pin the packages versions to exact values
# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        mmdebstrap \
        bubblewrap \
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
        udev \
        systemd-boot \
        gir1.2-ostree-1.0 \
        git && \
        rm -rf /var/lib/apt/lists/*

COPY files/pip.conf /etc/pip.conf
RUN pip install omegaconf

# Needed for uefi-ostree
RUN mkdir -p /var/www/html

RUN git clone https://github.com/zulcss/ruck /usr/src/ruck
RUN git clone https://github.com/zulcss/tiler /usr/src/tiler
RUN git clone https://github.com/zulcss/apt-ostree /usr/src/apt-ostree
RUN git clone https://github.com/zulcss/pablo-config /usr/src/pablo-config
