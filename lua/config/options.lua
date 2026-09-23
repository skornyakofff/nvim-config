vim.g.mapleader = " "
vim.g.maplocalleadr = "\\"

local opt = vim.opt

-- Нумерация строк
opt.number = true
opt.relativenumber = true

-- Отступы и табуляция
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
-- Для С
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "h" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

-- Подсветка текущей строки
opt.cursorline = true

-- Прокрутка
opt.scrolloff = 5
opt.sidescrolloff = 5

-- Поиск
opt.ignorecase = true
opt.smartcase = true

-- Файл и буферы
opt.undofile = true
opt.fileencoding = "utf-8"
opt.clipboard = "unnamedplus"

-- Перенос строк
opt.wrap = true
opt.linebreak = true

-- Отображение различных символов
opt.list = true
opt.listchars = {
  tab = '→ ',
  trail = '·',
  nbsp = '␣',
  extends = '❯',
  precedes = '❮'
}
opt.fillchars = { eob = " " }

-- Делаем возможной отмену изменения после закрытия файла
opt.undofile = true
opt.undolevels = 1000
opt.shada = "!,'1000,<50,s10,h"
opt.confirm = true

-- Разделение окон
opt.splitbelow = true
opt.splitright = true

-- Автодополнение
opt.wildmenu = true
opt.wildmode = "longest:full,full";
opt.completeopt = "menuone,noselect,noinsert"
opt.pumheight = 10

-- Таймауты
opt.timeoutlen = 500
opt.updatetime = 250

vim.cmd([[set rtp+=/home/nikita/.local/share/nvim/site]])
