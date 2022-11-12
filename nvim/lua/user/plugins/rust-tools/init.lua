local M = {}

M.init_opts = function(capabilities, on_attach)
    return {
        -- this option will be passed to rust-analyzer setup call
        server = {
            cmd = { "rustup", "run", "stable", "rust-analyzer" },
            capabilities = capabilities,
            on_attach = on_attach,
            standalone = false,
        },
        hover_actions = {
            auto_focus = true,
            border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            }
        },

        -- reload workspace if Cargo.toml is changed
        reload_workspace_from_cargo_toml = true,
    }
end

M.init = function(opts) 
    require("rust-tools").setup(opts)
end


return M
