require'nvim-treesitter.configs'.setup {
    auto_install = true,
    ensure_installed = { 
      "bash", 
      "c", 
      "cpp",
      "css",
      "dockerfile",
      "elixir",
      "heex",
      "eex",
      "go",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua", 
      "python",
      "r",
      "ruby",
      "rust", 
      "swift",
      "typescript",
      "toml",
      "vala",
      "vim",
      "yaml",
      "vue"
  },

  highlight = {
    enable = true,
    disable = {"embedded_template"},
  },

  autotag = {
    enable = true,
  }
}
