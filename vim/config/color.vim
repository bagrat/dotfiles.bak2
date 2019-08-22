function! s:set_colors()
    hi! VertSplit ctermfg=0 ctermbg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
endfunction

augroup set_colors
    autocmd!
    autocmd ColorScheme * call s:set_colors()
augroup end

colorscheme nord
set background=dark
