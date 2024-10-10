return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "html",
        "http",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "scss",
        "svelte",
        "sxhkdrc",
        "todotxt",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
