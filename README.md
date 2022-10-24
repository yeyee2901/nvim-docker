![image](https://user-images.githubusercontent.com/55247343/197177760-acc63637-fe01-4bda-b26b-de1e2582d375.png)
![image](https://user-images.githubusercontent.com/55247343/197178049-8ba20c75-9be6-4113-8eec-d7fd87ac2d95.png)
![image](https://user-images.githubusercontent.com/55247343/197178140-5445b53b-4a50-4805-82c0-5f083a767617.png)

Terminal used: `kitty`. If you want to also match the terminal theme, you can see my [kitty.conf file](https://github.com/yeyee2901/ark-linux-dot/blob/master/.config/kitty/kitty.conf).

# Yeyee's Dockerized Neovim Config
My neovim configuration, dockerized. I'm making this based on this consideration:
1. **Breaking Changes**: I'm updating my plugins, and suddenly my [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting borked. Apparently they made a breaking change by changing the whole TS highlighting group (`TSGroup` ➜  `@group`). Which breaks every colorscheme that use TS as their highlighting group. So, based on this consideration, I plan to LOCK EVERYTHING on a single commit (which I currently used & known to be stable, as of `2022-10-19`)
2. **Reproduction**: I'm encouraged to have a reproducible neovim configuration across multiple devices, since I plan to buy a gaming PC (I code on my Arch Linux laptop). I plan to make that PC as a secondary coding workstation when I'm working from home, and I don't want to go through the hassle of reconfiguring everything from the start. VM? Well, I considered that too, but that doesn't leverage the "minimal effort" required to reproduce my configurations. I want my neovim config reproduced with a single build command.
3. The second point also applies to anyone that wants to have my config file, but are afraid to clutter their system with the dependencies.

# Features
- Docker image based on Alpine Linux for minimal footprint, though it already hits 2 GB of storage, the neovim itself is small in size, but the development tools are not.
- Colorscheme using [nightfox](https:/github.com/EdenEast/nightfox.nvim), treesitter based.
- Native LSP (no install helper). Configured LSP:
    - `gopls` (Golang)
    - `astro` (Astro JS)
    - `tsserver` (Javascript, Typescript)
    - `eslint` (Javascript, Typescript, etc)
    - `intelephense` (PHP)
    - `ccls` (C/C++)
    - `pyright` (Python)
- Improved LSP experience using [lspsaga](https://github.com/glepnir/lspsaga.nvim) , [LSP signature](https://github.com/ray-x/lsp_signature.nvim)
- Debugging with [nvim-dap](https://github.com/mhfussenegger/nvim-dap)
- Autocompletion engine using [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with VSCode like icons using [lspkind](https://github.com/onsails/lspkind.nvim).
- Extendable snippet engine using [UltiSnips](https://github.com/SirVer/ultisnips).
- Treesitter setup, installed parsers:
    - `go` 
    - `html` 
    - `css`
    - `javascript` 
    - `typescript`
    - `tsx` 
    - `astro` 
    - `python` 
    - `json` 
    - `yaml` 
    - `query` 
    - `proto` (protobuf files)
    - `comment` (`TODO:`, `WARN:`, comment highlighting)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim) for statusline, using pre-made config `evil lualine`.
- [Barbar](https://github.com/romgrk/barbar.nvim) handling vim buffers turned into handling tabs.
- [Nvim-Tree](https://github.com/kyazdani42/nvim-tree.lua) for file tree viewer.
- [Telescope superpower](https://github.com/nvim-telescope/telescope.nvim)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git integration.
- [Formatter](https://github.com/mhartington/formatter.nvim) , with configured formatter:
    - Astro JS (`prettier`)
    - HTML/CSS (`prettier`)
    - JSON (`prettier`)
    - Markdown (`prettier`)
    - Javascript / Typescript (`prettier`)
    - React / React Typescript (`prettier`)
    - C/C++ (`clang-format`)
    - Python (`autopep8`)
    - Golang (`gofmt` & `gofumpt`)
    - Proto (`clang-format`)
- [Vim Commentary](https://github.com/tpope/vim-commentary) toggling comments, made easy.
- [Vim Surround](https://github.com/tpope/vim-surround) surrounding something with tags, parantheses, curly braces, etc, made easy.
- [Colortils](https://github.com/max397574) color selector, useful for working with CSS.

# Pulling The Docker Image
Run:
```bash
docker pull yeyee2901/nvim-docker:1.0

# stable version with commit locks
docker pull yeyee2901/nvim-docker:1.0-stable
```
Or, you can visit the dockerhub [directly](https://hub.docker.com/repository/docker/yeyee2901/nvim-docker) if you want to take a look.

# Building The Docker Image Yourself
- First, make sure docker is installed in your system. I won't go into details on how to install this, each system has their own package manager right?
- Pull this repo
```bash
git pull https://github.com/yeyee2901/nvim-docker.git
```
- Before building the image, you can customize the neovim configuration file first, in case you want to add more plugins etc 👌
- Build it:
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
