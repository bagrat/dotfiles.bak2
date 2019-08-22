if $USE_SYMBOLS == 1
    let g:buffet_powerline_separators = 1
    let g:buffet_use_devicons = 1
    let g:buffet_tab_icon = "\uf00a"
    let g:buffet_left_trunc_icon = "\uf0a8"
    let g:buffet_right_trunc_icon = "\uf0a9"
else
    let g:buffet_powerline_separators = 0
    let g:buffet_use_devicons = 0
endif

map <Tab> :bn<CR>
map <S-Tab> :bp<CR>
map <leader><Tab> :Bw<CR>
map <leader><S-Tab> :Bw!<CR>
map <C-t> :tab split<CR>

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=6 ctermfg=0 guibg=#00FF00 guifg=#000000
    hi! BuffetActiveBuffer cterm=NONE ctermbg=8 ctermfg=6 guibg=#00FF00 guifg=#000000
    hi! BuffetBuffer cterm=NONE ctermbg=8 ctermfg=7 guibg=#00FF00 guifg=#000000
    hi! BuffetTrunc cterm=NONE ctermbg=7 ctermfg=0 guibg=#00FF00 guifg=#000000

endfunction
