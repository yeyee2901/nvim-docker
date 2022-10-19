FROM alpine:3.14

# Update OS
RUN apk update && apk upgrade

# Install dependencies
RUN apk add \
    curl \
    git \
    gcc

# Move the config files
COPY nvim /root/.config/

# Install packer (neovim plugin manager)
RUN git clone --depth 1 \
    https://github.com/wbthomason/packer.nvim \
    /root/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install all plugins
# I don't know the proper way to do this atm :)
# If you happen to have some info on the "elegant" way,
# hit me up via discord.
RUN nvim --headless -c "PackerSync" -c "sleep 30" -c "qall"

# set working directory
WORKDIR /root/workspace
CMD [ "/bin/bash" ]
