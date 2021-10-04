local cmd = vim.cmd

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
cmd [[
let ignore_filetypes = ["dashboard", "terminal"]
au InsertEnter * if index(ignore_filetypes, &ft) < 0 | set nornu
au InsertLeave * if index(ignore_filetypes, &ft) < 0 | set rnu
]]

-- Hide line numbers inside terminal
cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

-- Hide bufferline inside dashboard
cmd [[ autocmd FileType dashboard setlocal showtabline=0 nonu nornu ]]

-- Filetype specifics
cmd [[ autocmd Filetype lua setlocal tabstop=3 shiftwidth=3 softtabstop=3 ]]

-- Auto format on save
cmd [[ 
augroup fmt
   autocmd!
   autocmd BufWritePre *.lua,*.py,*.rc undojoin | silent! Neoformat 
augroup END
]]

-- Yank highlight confirmation
cmd [[
augroup highlight_yank
   autocmd!
   au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END
]]
