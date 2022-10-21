# Yeyee's Dockerized Neovim Config
My neovim configuration, dockerized. I'm making this based on this consideration:
1. **Breaking Changes**: I'm updating my plugins, and suddenly my [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting borked. Apparently they made a breaking change by changing the whole TS highlighting group (`TSGroup` ➜  `@group`). Which breaks every colorscheme that use TS as their highlighting group. So, based on this consideration, I plan to LOCK EVERYTHING on a single commit (which I currently used & known to be stable, as of `2022-10-19`)
2. **Reproduction**: I'm encouraged to have a reproducible neovim configuration across multiple devices, since I plan to buy a gaming PC (I code on my Arch Linux laptop). I plan to make that PC as a secondary coding workstation when I'm working from home, and I don't want to go through the hassle of reconfiguring everything from the start. VM? Well, I considered that too, but that doesn't leverage the "minimal effort" required to reproduce my configurations. I want my neovim config reproduced with a single build command.
3. The second point also applies to anyone that wants to have my config file, but are afraid to clutter their system with the dependencies.

# Pulling The Docker Image
Run:
```bash
docker pull yeyee2901/nvim-docker:1.0
```
Or, you can visit the dockerhub [directly](https://hub.docker.com/repository/docker/yeyee2901/nvim-docker) if you want to take a look.

# Building The Docker Image Yourself
- First, make sure docker is installed in your system. I won't go into details on how to install this, each system has their own package manager right?
- You can customize the neovim configuration file first, in case you want to add more plugins etc 👌
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

# Detaching & Ataching
- Firstly, you can detach from the container by pressing `CTRL-P CTRL-Q`, this wil keep the container from shutting down
- To attach to the container again you can use `docker attach`.
```bash
docker attach <container_id>
```

# Single Container, Multiple Bash Login Session
- If you use `docker attach`, this is ≠ remote login, this will `attach` you to the same shell session, meaning, anything you type on the first window will also be reflected on the second window you used to `attach`, since they're the same shell session.
- You can do remote login to the container from your local shell by using `docker exec`:
```bash
docker exec -it <container_id> /bin/bash
```
- This will spawn you a new `bash` session, which is actually like SSH-ing to the container. Docker doesn't need SSH, we already have this.

# Happy Vimming 🔥
