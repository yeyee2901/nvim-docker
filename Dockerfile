FROM alpine:3

# Update packages
RUN apk update && apk upgrade

# TODO: install dependencies

# Install packer (neovim plugin manager)
RUN git clone --depth 1 \
    https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# set working directory
WORKDIR /root/workspace
CMD [ "/bin/bash" ]
