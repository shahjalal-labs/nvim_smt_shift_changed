return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    init = function()
        -- Let treesitter treat 'kulala_http' exactly like 'http' from the start
        vim.treesitter.language.register("http", "kulala_http")
    end,
    config = function()
        vim.schedule(function()
            local ok, treesitter = pcall(require, "nvim-treesitter.config")
            if not ok then
                vim.notify("nvim-treesitter.config not available", vim.log.levels.ERROR)
                return
            end

            treesitter.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
                highlight = { enable = true },
                indent = { enable = true },
                autotag = { enable = true },
                ensure_installed = {
                    "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
                    "prisma", "markdown", "markdown_inline", "svelte", "graphql",
                    "bash", "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc", "c",
                    "http",
                },
                -- Incremental selection is gone in the latest main branch, Flash S is its replacement
                -- So we don't set incremental_selection keymaps; Flash handles it.
            })

            -- Start treesitter for both http and kulala_http filetypes
            local function start_http(buf)
                vim.treesitter.start(buf, "http")
            end
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "http", "kulala_http" },
                callback = function(args)
                    start_http(args.buf)
                end,
            })

            -- For already-open buffers (like the first one), start manually
            local buf = vim.api.nvim_get_current_buf()
            local ft = vim.bo[buf].filetype
            if ft == "http" or ft == "kulala_http" then
                start_http(buf)
            end
        end)
    end,
}
