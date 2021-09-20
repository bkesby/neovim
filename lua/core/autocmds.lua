local cmd = vim.cmd

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
cmd [[ au InsertEnter * set norelativenumber ]]
cmd [[ au InsertLeave * set relativenumber ]]

-- Hide line numbers inside terminal
cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

-- Hide status line on certain windows (defined in utils)
-- cmd [[ autocmd BufEnter,BufWinEnter,FileType,WinEnter * lua require("core.utils").hide_statusline() ]]

-- Filetype specifics
cmd [[ autocmd Filetype lua setlocal tabstop=3 shiftwidth=3 softtabstop=3 ]]

-- Auto format on save
cmd [[ 
   augroup fmt
      autocmd!
      autocmd BufWritePre * undojoin | Neoformat 
   augroup END
]]
