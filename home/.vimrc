"=====[ vundle plugins ]========================================================

set nocompatible             " be iMproved, required
"filetype off                 " required

call plug#begin('~/.vim/plugged')

Plug 'thinca/vim-localrc'

Plug 'scrooloose/syntastic'

" syntax highlighting
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

"Plug 'nathanaelkane/vim-indent-guides'

" Plug 'Raimondi/delimitMate'
" Plug 'junegunn/vim-easy-align'

"Plug 'scrooloose/syntastic'
"Plug 'mtscout6/syntastic-local-eslint.vim'

Plug 'morhetz/gruvbox'

" Plug 'maksimr/vim-jsbeautify'

"Plug 'vim-airline/vim-airline'

"Plug 'valloric/youcompleteme'
"Plug 'marijnh/tern_for_vim'

" Plug 'tpope/vim-surround'

call plug#end()

"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"=====[ Raimondi/delimitMate ]==================================================

" let delimitMate_expand_cr = 1

"=====[ nathanaelkane/vim-indent-guides ]=======================================

"let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 2
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8

"=====[ syntastic configuration ]===============================================

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_mode_map = { 'mode': 'passive' }
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_loc_list_height = 3
"
"nmap <leader>sc :SyntasticCheck<CR>

let g:syntastic_ruby_checkers          = ['rubocop', 'mri']


"=====[ jsbeautify shortcuts ]==================================================

" nmap <leader>jb :call JsBeautify()<CR>

"=====[ easyalign shortcuts ]===================================================

" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

"=====[ colorscheme ]===========================================================

colorscheme gruvbox
set background=light
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"

"=====[ show leader ]===========================================================

set showcmd

"==[ watch and auto-reload this config file ]===================================

augroup VimReload
autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

"==[ turn syntax highlighting on ]==============================================

syntax enable

"==[ turn line numbering on ]===================================================

set number

"==[ hint 80th column on long lines ]===========================================

" let the color scheme do its thing
"highlight ColorColumn ctermbg=white
call matchadd('ColorColumn', '\%81v', 100)

" mark every fortieth
"set colorcolumn=39,79,119

" mark tails as errors
"match ErrorMsg '\%>79v.\+'

"==[ render whitespace visually ]===============================================

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"==[ make command history longer ]==============================================

set history=10000

"==[ better digraph handling ]==================================================

" enable betterdigraphs.vim
"inoremap <expr> <C-K> BDG_GetDigraph()

"==[ better visual block handling ]=============================================

"set virtualedit=block
"
"runtime plugin/dragvisuals.vim
"
"vmap  <expr>  <LEFT>   DVB_Drag('left')
"vmap  <expr>  <RIGHT>  DVB_Drag('right')
"vmap  <expr>  <DOWN>   DVB_Drag('down')
"vmap  <expr>  <UP>     DVB_Drag('up')
"vmap  <expr>  D        DVB_Duplicate()
"
"let g:DVB_TrimWS = 1     " remove any introduced trailing whitespace after

"====[ trailing spaces ]========================================================

" double-delete to remove trailing whitespace
nnoremap <silent> <BS><BS> <Esc>:call TrimTrailingWS()<CR><Esc>

function! TrimTrailingWS ()
    if search('\s\+$', 'cnw')
        :%s/\s\+$//g
    endif
endfunction

"====[ set up smarter search behaviour ]========================================

set hlsearch        " highlight all matches
set incsearch       " lookahead as search pattern is specified
set ignorecase      " ignore case in all searches...
set smartcase       " ...unless uppercase letters used

"highlight Search      ctermfg=red ctermbg=white
highlight SearchBlink ctermfg=white ctermbg=red

" clean highlighting
nnoremap <silent> <BS> <Esc>:nohlsearch<CR><Esc>

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.1)<cr>
nnoremap <silent> N   N:call HLNext(0.1)<cr>

" OR ELSE just highlight the match in red...
function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('SearchBlink', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

"==[ use persistent undo ]======================================================

if has('persistent_undo')

  " set undo directory and make it if not existing
  set undodir=$HOME/.vim/undodir
  call system('mkdir -p '.&undodir)

  " make history longer
  set undolevels=5000

  " switch feature on
  set undofile

endif

"==[ goto last location in non-empty files ]====================================

" no idea how this works
autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
                   \|     exe "normal! g`\""
                   \|  endif

"==[ tabs and indentation handling ]============================================

set tabstop=2       " tab indentation levels every four columns
set shiftwidth=2    " indent/outdent by four columns
set expandtab       " convert all tabs that are typed into spaces

autocmd Filetype javascript setlocal tabstop=4 shiftwidth=4


set shiftround      " always indent/outdent to nearest tabstop
set smarttab        " use shiftwidths at left margin, tabstops everywhere else

"set autoindent      " retain indentation on next line
"set smartindent     " turn on autoindenting of blocks

"==[ Miscellaneous features (mainly options) ]==================================

"set autowrite       " save buffer automatically when changing files
"set autoread        " always reload buffer when external changes detected

set scrolloff=2     " scroll when 2 lines from top/bottom

" Keycodes and maps timeout in 3/10 sec...
set timeout timeoutlen=200 ttimeoutlen=200
" not too convinced about this.


"=====[ Add or subtract comments ]==============================================

filetype plugin on

" Work out what the comment character is, by filetype...
autocmd FileType             haskell,lua                       let b:cmt = exists('b:cmt') ? b:cmt : '--'
autocmd FileType             latex,tex                         let b:cmt = exists('b:cmt') ? b:cmt : '%'
autocmd FileType             javascript                        let b:cmt = exists('b:cmt') ? b:cmt : '//'
autocmd FileType             *sh,awk,python,perl,perl6,ruby    let b:cmt = exists('b:cmt') ? b:cmt : '#'
autocmd FileType             vim                               let b:cmt = exists('b:cmt') ? b:cmt : '"'
autocmd BufNewFile,BufRead   *.tex                             let b:cmt = exists('b:cmt') ? b:cmt : '%'
autocmd BufNewFile,BufRead   *.vim,.vimrc                      let b:cmt = exists('b:cmt') ? b:cmt : '"'
autocmd BufNewFile,BufRead   *                                 let b:cmt = exists('b:cmt') ? b:cmt : '#'
autocmd BufNewFile,BufRead   *.p[lm],.t                        let b:cmt = exists('b:cmt') ? b:cmt : '#'

autocmd FileType * set formatoptions-=r

function! ToggleComment ()
  " delimiter defaults to #
  let comment_delimiter = ( exists('b:cmt') ? b:cmt : '#' ) . ' '
  let current_line = getline(".")
  let leading_whitespace = '^\(\s*\)'
  let comment_head = leading_whitespace . comment_delimiter
  if current_line =~ comment_head " then uncomment it:
    let replacement_line = substitute(current_line, comment_head, '\1', '')
    call setline(".", replacement_line)
  else " comment it:
    let replacement_line = substitute(current_line, leading_whitespace, '\1' . comment_delimiter, '')
    call setline(".", replacement_line)
  endif
endfunction

function! ToggleBlock () range
  " delimiter defaults to #
  let comment_delimiter = ( exists('b:cmt') ? b:cmt : '#' ) . ' '
  let current_line = getline(".")
  let leading_whitespace = '^\(\s*\)'
  let comment_head = leading_whitespace . comment_delimiter
  let line_number = a:firstline
  let current_lines = getline(a:firstline, a:lastline)
  " action taken is decided by the first line
  if current_lines[0] =~ comment_head
    for line in current_lines
      let replacement_line = substitute(line, comment_head, '\1', '')
      call setline(line_number, replacement_line)
      let line_number += 1
    endfor
  else
    for line in current_lines
      let replacement_line = substitute(line, leading_whitespace, '\1' . comment_delimiter, "")
      call setline(line_number, replacement_line)
      let line_number += 1
    endfor
  endif
endfunction

" Set up the relevant mappings
nmap <silent> # :call ToggleComment()<CR>j0
vmap <silent> # :call ToggleBlock()<CR>

" smarter matching
runtime macros/matchit.vim

"==[ turn mouse on ]============================================================

set mouse=a

"==[ vim | zathura | synctex ]==================================================

function! SyncTeX()
    let l:source = line('.') . ":" . col('.') . ":" . bufname('%')
    let l:target = expand("%:r") . ".pdf"
    execute "silent ! zathura --synctex-forward ".l:source." ".l:target
    execute ":redraw!"
endfunction

map <F12> :call SyncTeX()<cr>

function! Zathura()
    let l:vcall = "\"vim --servername VIM --remote +\\%{line} \\%{input}\""
    let l:target = expand("%:r") . ".pdf"
    execute "silent ! (zathura -x " . l:vcall . " " . l:target . "&) &>/dev/null"
endfunction

map <F9> :call Zathura()<cr>

"=====[ automatic headers ]=====================================================

function! PawHeader(leader,lbrace,rbrace,level)
    let comment_char = exists('b:cmt') ? b:cmt : ''
    let currline = getline(".")
    let l:gap = repeat( a:leader, a:level*&tabstop - len(a:lbrace) - len(comment_char) )
    let l:head = comment_char . l:gap . a:lbrace
    let l:tail = a:rbrace . l:gap
    if currline =~ '^$'
        let repline = l:head . l:tail
        call setline(".", repline)
        call cursor(line('.'), len(l:head))
        call feedkeys('a')
    elseif currline =~ '^' . l:head
            if len(currline) == 80
                call cursor(line('.'), len(l:head))
                call feedkeys('a')
            elseif len(currline) > 80
                call setline(".", strpart(currline,0,80))
            elseif len(currline) < 80
                call setline(".", currline . repeat(a:leader,80-len(currline)))
            endif
    endif
endfunction

map <F5> :call PawHeader('=','[ ',' ]',3)<cr>
map <F6> :call PawHeader('-','[ ',' ]',2)<cr>

"=====[ asd ]===================================================================

" rethink these someday:
map <F7> :s/-/=/g<cr>
map <F8> :s/=/-/g<cr>

"=====[ sudo shortcuts ]========================================================

"cmap w!! w !sudo tee > /dev/null %


autocmd FileType latex,tex vmap 4 :s/\%V\(.*\)\%V/$\1$/g<CR>
vmap = :!fmt<CR>



"=========[ syntastic ]=========================================================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']


let g:syntastic_error_symbol = '▶'
let g:syntastic_warning_symbol = '▷'
let g:syntastic_style_error_symbol = '●'
let g:syntastic_style_warning_symbol = '○'

"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn

" stolen from https://github.com/mtscout6/syntastic-local-eslint.vim
" let s:lcd = fnameescape(getcwd())
" silent! exec "lcd" expand('%:p:h')
" let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
" let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
" exec "lcd" s:lcd
" let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

"function! StrTrim(txt)
"  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
"endfunction

"let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_tex_checkers = []


let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_sh_shellcheck_args = "--external-sources"

