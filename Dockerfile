# Pull official Ubuntu 20.04 Docker image
FROM ubuntu:20.04

# Install Git and Sudo
RUN apt update
RUN apt install git sudo -y

# Set up new user for future usage
# Don't use root for Android building
RUN useradd -m -s /bin/bash hendra
RUN echo 'hendra ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
USER hendra
WORKDIR /home/hendra

# Set timezone
RUN sudo ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Set up environment
# with @akhilnarang's script:
# https://github.com/akhilnarang/scripts
RUN git clone https://github.com/akhilnarang/scripts --depth=1 --single-branch
RUN cd scripts/ && bash setup/android_build_env.sh

