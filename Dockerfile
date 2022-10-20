FROM ubuntu:22.04

LABEL maintainer="yeyee2901"
LABEL description="My neovim config, dockerized"
LABEL version="1.0"

# Variables
ARG GOLANG_VERSION="1.19.2"
ARG GOLANG_ARCH="amd64"

# Update OS
RUN apt update -y && apt upgrade -y

# Install dependencies
RUN apt install -y \
    bash \
    curl \
    git \
    grep \
    gcc \
    nodejs \
    python3 \
    python3-dev \
    python3-pip

# Install python packages
RUN pip3 install --upgrade pip neovim

# Move the config files
COPY nvim /root/.config/nvim

# CHANGE WORKDIR ----------------------------------------------
WORKDIR /root

# Install neovim
RUN curl --http1.1 -SL https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz -o nvim-linux64.tar.gz
RUN tar -xvf nvim-linux64.tar.gz

# Install packer (neovim plugin manager)
RUN git clone --depth 1 \
    https://github.com/wbthomason/packer.nvim \
    /root/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install all plugins
RUN /root/nvim-linux64/bin/nvim --headless -c "PackerSync" -c "autocmd User PackerComplete qall"
RUN /root/nvim-linux64/bin/nvim --headless -c \
    "TSInstallSync \
        go \
        html \
        css \
        javascript \
        typescript \
        tsx \
        astro \
        python \
        json \
        yaml \
        query \
        proto \
        comment" -c "qall"

# FOR OTHER APP INSTALLATIONS 
RUN mkdir apps

# INSTALL GOLANG
RUN curl -OL "https://golang.org/dl/go${GOLANG_VERSION}.linux-${GOLANG_ARCH}.tar.gz"
RUN tar -xvf "go${GOLANG_VERSION}.linux-${GOLANG_ARCH}.tar.gz"
RUN chown -R root:root ./go
RUN mv -v go /root/apps/golang

# COPY BASH CONFIG FILE 
# contains PATH, aliases, etc
# from this point on, run using bash
COPY .bashrc /root/.bashrc

# Install language servers
RUN /root/apps/golang/bin/go install golang.org/x/tools/gopls@latest

# configure git so it doesn't yell at us
RUN git config --global --add safe.directory /root/workspace

# CHANGE WORKDIR ----------------------------------------------
WORKDIR /root/workspace



# launch using bash
CMD [ "/bin/bash" ]
