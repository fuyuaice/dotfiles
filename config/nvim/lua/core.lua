local options = {
    --System
    encoding = "utf-8",
    backup = false,
    swapfile = false,
    expandtab = true,
    tabstop = 4,
    shiftwidth = 4,
    smartindent = true,
    list = true,
    --listchars = " ",
    wildmenu = true,
    --UI
    background = "dark",
    relativenumber = true,
    mouse = "a",
    cursorline = true,
    visualbell = true,
    syntax = "enable",
}

for k,v in pairs(options) do
    vim.opt[k] = v
end
