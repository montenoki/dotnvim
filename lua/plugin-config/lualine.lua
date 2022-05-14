local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("lualine Not Found!")
  return
end

lualine.setup({
  options = {
    theme = "auto",
    component_separators = { left = "|", right = "|" },
    -- https://github.com/ryanoasis/powerline-extra-symbols
    section_separators = { left = " ", right = "" },
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        symbols = {
          unix = "LF", -- e712
          dos = "CRLF", -- e70f
          mac = "CR", -- e711
        },
      },
      "encoding",
      "filetype",
    },
  },
})
