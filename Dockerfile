FROM alpine:latest

LABEL maintainer="yeyee2901"
LABEL description="My neovim config, dockerized"
LABEL version="1.0"

###############
## VARIABLES ##
###############
ARG APK_PACKAGES="\
    autoconf automake cmake curl g++ gcc gettext gettext-dev \
    git libtool make ninja openssl pkgconfig unzip binutils \
    nodejs npm yarn grep python3 python3-dev py3-pip bash curl \
    go ccls clang clang-extra-tools ripgrep \
"
ARG GOLANG_VERSION="1.19.2"
ARG GOLANG_ARCH="amd64"
ARG PIP_INSTALL="\
    neovim autopep8 \
"
ARG NPM_INSTALL="\
    vscode-langservers-extracted typescript \
    typescript-language-server @astrojs/language-server \
    eslint prettier pyright intelephense \
"
ARG NEOVIM_BRANCH="release-0.8"
ARG NEOVIM_TREESITTER_PARSERS="\
        go html css javascript typescript \
        tsx astro python json yaml query proto \
        comment bash \
"



###############
## UPDATE OS ##
###############
RUN apk update && apk upgrade


################
## NATIVE PKG ##
################
RUN apk add ${APK_PACKAGES} && rm -rf /var/cache/apk/*


###############
# NVIM CONFIG #
###############
COPY nvim /root/.config/nvim




##############################################
#               CHANGE WORKDIR               #
##############################################
WORKDIR /root




##################
# INSTALL NEOVIM #
##################
RUN git clone https://github.com/neovim/neovim.git neovim && \
  cd neovim && \
  git fetch --all --tags -f && \
  git checkout ${NEOVIM_BRANCH} && \
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  cd ..

# Inject all plugins
# - I don't know why but packer does not load on first neovim launch
# the second one always loads
RUN nvim --headless -c "qall"

# - packer has an install complete event, we can use that to detect
# when to exit, otherwise neovim will exit immediately since packer
# runs asynchronously
RUN nvim --headless \
    -c "autocmd User PackerComplete qall" \ 
    -c "PackerSync"

# Install treesitter parsers
RUN nvim --headless \
    -c "TSInstallSync ${NEOVIM_TREESITTER_PARSERS}" \
    -c "qall"


##########################
#    LSP & DEV TOOLS     #
##########################
RUN go install golang.org/x/tools/gopls@latest
RUN go install github.com/fatih/gomodifytags@latest
RUN go install github.com/josharian/impl@latest
RUN go install github.com/ChimeraCoder/gojson/gojson@latest
RUN npm i -g --omit=dev ${NPM_INSTALL}
RUN pip3 install ${PIP_INSTALL}


###################
#   GIT CONFIG    #
###################
# so it doesn't yell at us for being root
RUN git config --global --add safe.directory /root/workspace


#########################
# SHELL - ENV - ALIASES #
#########################
COPY .bashrc .bashrc


################
#   LAUNCH 🚀  #
################
WORKDIR /root/workspace
CMD [ "/bin/bash" ]
