
" Launch Config
" ---------------------------------------------------------
" these are options set at launch to configure external tools exactly once.
call pathogen#infect()         " use pathogen

set noswapfile                 " don't create a swap backup
set encoding=utf-8

" Colors
" ---------------------------------------------------------
syntax enable                  " enable syntax highlighting

" set rainbow colors for parenthesis
let g:niji_dark_colours = [['38', 'red1'],
                         \ ['104', 'orange1'],
                         \ ['176', 'yellow1'],
                         \ ['214', 'greenyellow'],
                         \ ['184', 'green1'],
                         \ ['113', 'springgreen1'],
                         \ ['80', 'cyan1']]

colorscheme lucius             " set color scheme
LuciusBlackLowContrast         " activate the lucius color scheme

" Spaces & Tabs
" ---------------------------------------------------------
"set tabstop=4                  " number of visual spaces per TAB
"set softtabstop=4              " number of spaces in tab when editing
"set expandtab                  " tabs are spaces

" Emphasize trailing spaces
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing spaces on save
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" UI Config
" ---------------------------------------------------------
set laststatus=2               " activate statusline always
set number                     " show line numbers
set showcmd                    " show command in bottom bar
set cursorline                 " highlight current line
set wildmenu                   " visual autocomplete for command menu
set lazyredraw                 " redraw only when we need to.
set showmatch                  " highlight matching [{()}]
filetype plugin indent on      " load filetype-specific indent files
set clipboard=unnamed

" Configure airline
" --------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" Configure nerd tree
" --------------------------------------------------------

" autocmd vimenter * NERDTree    " open nerd tree on startup
" autocmd vimenter * :wincmd l   " switch to the actual opened file

" open nerd tree even if no file was opened
autocmd stdinreadpre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if nerd tree is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Tmux
" ---------------------------------------------------------
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Goyo
" ---------------------------------------------------------
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

let g:goyo_width=100

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Limelight
" ---------------------------------------------------------
let g:limelight_default_coefficient = 0.35

" Synthastic
" ---------------------------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Custom shortcuts
" ---------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>

map <C-l> ::set number! number?<CR>

map <C-m> :Goyo<CR>



