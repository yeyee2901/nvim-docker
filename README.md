# Yeyee's Dockerized Neovim Config
My neovim configuration, dockerized. I'm making this based on this consideration:
1. **Breaking Changes**: I'm updating my plugins, and suddenly my [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting borked. Apparently they made a breaking change by changing the whole TS highlighting group (`TSGroup` ➜  `@group`). Which breaks every colorscheme that use TS as their highlighting group. So, based on this consideration, I plan to LOCK EVERYTHING on a single commit (which I currently used & known to be stable, as of `2022-10-19`)
2. **Reproduction**: I'm encouraged to have a reproducible neovim configuration across multiple devices, since I plan to buy a gaming PC (I code on my Arch Linux laptop). I plan to make that PC as a secondary coding workstation when I'm working from home, and I don't want to go through the hassle of reconfiguring everything from the start. VM? Well, I considered that too, but that doesn't leverage the "minimal effort" required to reproduce my configurations. I want my neovim config reproduced with a single build command.
3. The second point also applies to anyone that wants to have my config file, but are afraid to clutter their system with the dependencies.

# Pulling The Docker Image (WIP, not pushed yet to dockerhub)

# Building The Docker Image
- First, make sure docker is installed in your system. I won't go into details on how to install this, each system has their own package manager right?
## Arch Based System
```bash
docker build -t nvim-docker:1.0 --no-cache .
```
## Otherwise:
```bash
docker-build -t nvim-docker:1.0 --no-cache .
```


# Running The Container
## Arch Based System
```bash
docker run -it --volume $(pwd):/root/workspace
```
## Others
```bash
docker-run -it --volume $(pwd):/root/workspace
```

# Using Single Container, Multiple Neovim Instances
If you don't wanna clutter your system with multiple running containers, you can opt to use a single running container.
- Firstly, you can detach from the container by pressing `CTRL-P CTRL-Q`, this wil keep the container from shutting down
- You can attach from your local shell to the container by using:
```bash
docker attach <container_id>
```
