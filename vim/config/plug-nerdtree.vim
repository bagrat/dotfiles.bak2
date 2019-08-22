noremap <leader>t :NERDTreeToggle<CR>

let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"

augroup nerdtreeconceal
    autocmd!
    autocmd FileType nerdtree setlocal conceallevel=3
    autocmd FileType nerdtree setlocal concealcursor=nvic
    autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
    autocmd FileType nerdtree syntax match NERDTreeExecAsterisk #*$# containedin=NERDTreeExecFile conceal contained
    autocmd FileType nerdtree syntax clear NERDTreeFlags
augroup END
