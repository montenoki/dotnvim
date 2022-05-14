local colorscheme = "dracula"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
vim.o.background = "dark"
vim.g.tokyonight_style = "storm" -- day / night
-- 透明化
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme: " .. colorscheme .. " Not Found!")
    return
end
