FROM alpine:3

# Update packages
RUN apk update && apk upgrade

# TODO: install dependencies

# set working directory
WORKDIR /root/workspace
CMD [ "/bin/bash" ]
