# Yeyee's Dockerized Neovim Config
My neovim configuration, dockerized. I'm making this based on this consideration:
1. **Breaking Changes**: I'm updating my plugins, and suddenly my [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting borked. Apparently they made a breaking change by changing the whole TS highlighting group (`TSGroup` ➜  `@group`). Which breaks every colorscheme that use TS as their highlighting group. So, based on this consideration, I plan to LOCK EVERYTHING on a single commit (which I currently used & known to be stable, as of `2022-10-19`)
2. **Reproduction**: I'm encouraged to have a reproducible neovim configuration across multiple devices, since I plan to buy a gaming PC (I code on my Arch Linux laptop). I plan to make that PC as a secondary coding workstation when I'm working from home, and I don't want to go through the hassle of reconfiguring everything from the start. VM? Well, I considered that too, but that doesn't leverage the "minimal effort" required to reproduce my configurations. I want my neovim config reproduced with a single build command.
3. The second point also applies to anyone that wants to have my config file, but are afraid to clutter their system with the dependencies.