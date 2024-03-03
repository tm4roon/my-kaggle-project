#!/bin/bash

# -----------------------------------------------------------------------------
# Utilities
# -----------------------------------------------------------------------------
sudo apt install unzip

# -----------------------------------------------------------------------------
# Python
# -----------------------------------------------------------------------------
sudo apt update
sudo apt install -y python3-pip

pip install cookiecutter 
pip install kaggle

export PATH=$HOME/.local/bin:$PATH
echo "export PATH=$HOME/.local/bin:$PATH" >> $HOME/.bashrc

# -----------------------------------------------------------------------------
# Docker
# -----------------------------------------------------------------------------

# Refer: https://docs.docker.com/engine/install/ubuntu/

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt-get install -y docker-compose-plugin

# ユーザの追加
sudo groupadd docker
sudo gpasswd -a $USER docker

# -----------------------------------------------------------------------------
# CUDA
# -----------------------------------------------------------------------------
# Install CUDA 
# ref: https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_local
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.3.2/local_installers/cuda-repo-ubuntu2004-12-3-local_12.3.2-545.23.08-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-12-3-local_12.3.2-545.23.08-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2004-12-3-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-3

sudo apt-get install -y cuda-drivers
sudo apt-get install -y nvidia-kernel-open-545
sudo apt-get install -y cuda-drivers-545

# Install NVIDIA Container Toolkit
# ref: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/1.14.5/install-guide.html
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt install -y nvidia-container-toolkit

# 以下のエラーの対応として、nvidia-container-runtimeをインストールする
# Error response from daemon: could not select device driver "nvidia" with capabilities: [[gpu]]
sudo apt-get install -y nvidia-container-runtime
sudo service docker restart
