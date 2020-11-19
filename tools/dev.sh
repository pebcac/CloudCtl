#!/bin/bash -x
project="konductor-cloudctl"

# Prep SSH, Credentials, & Bash
sudo rm -rf /tmp/.ssh /tmp/.gitconfig /tmp/.bashrc
sudo cp -rf ~/.ssh ~/.gitconfig ~/.bashrc /tmp/
sudo podman run -it --rm \
    -h ${project} --name ${project} \
    --entrypoint bash --privileged \
    --volume /tmp/.ssh:/root/.ssh:z \
    --volume /tmp/.bashrc:/root/.bashrc:z \
    --volume $(pwd):/root/platform/iac/cloudctl:z \
    --workdir /root/platform/iac/cloudctl \
  quay.io/cloudctl/konductor:latest
#   --volume /tmp/.gitconfig:/root/.gitconfig:z \
