" Behave less like vi
set nocompatible

" Except enable the vi backspace behavior to force myself out of insert mode
" (run as autocmd to avoid conflict with vim-sensible plugin)
autocmd VimEnter,BufNewFile,BufReadPost * silent set backspace=0

" Allow unsaved buffers
set hidden

" Set terminal title
set title

" Highlight current line
set cursorline

" Enable mouse (primarily so mouse selections use visual mode)
set mouse=a

" Automatically copy visual selection to selection clipboard
set clipboard=autoselect

" Let yanks go to selection clipboard
set clipboard+=unnamed

" If available, let all other default register actions go to primary clipboard
if has('unnamedplus')
    set clipboard+=unnamedplus
endif

" Enable more natural window splits
set splitbelow
set splitright

" Show line numbers for jumping around
set relativenumber

" Disable wrapping, show indicators on overflow, scroll smoothly
set nowrap list sidescroll=1

" Use more bash-like file completion (don't cycle through options)
set wildmode=longest,list

" Default to four spaces for tabs
set shiftwidth=4
set expandtab

" New-style source code uses two spaces for tabs
autocmd FileType javascript,json,puppet,ruby,yaml setlocal shiftwidth=2

" Makefiles must use hard tabs, but let them appear as four spaces
autocmd FileType make setlocal tabstop=4 noexpandtab

" Create shortcuts to switch between indenting styles:
" default 4-space indent
nnoremap <Leader>0 :setlocal shiftwidth=4 tabstop=8 expandtab<CR>
" modern 2-space indent
nnoremap <Leader>1 :setlocal shiftwidth=2 tabstop=8 expandtab<CR>
" 4-space hard tab
nnoremap <Leader>2 :setlocal shiftwidth=4 tabstop=4 noexpandtab<CR>
" 8-space hard tab
nnoremap <Leader>3 :setlocal shiftwidth=8 tabstop=8 noexpandtab<CR>

" Load Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Let airline show the mode
set noshowmode

" Hide empty airline sections
let g:airline_skip_empty_sections = 1

" Show tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" On modern terminals or GUI, enable Powerline characters
if &t_Co >= 256 || has("gui_running")
    let g:airline_powerline_fonts = 1
endif

" Konsole doesn't support special Base16 colors despite advertising itself
" as xterm-265color by default.  I configure it to say it's konsole-256color
" so I can detect it here and enable true color support.
if $TERM ==# 'konsole-256color'
    set term=xterm-256color
    set termguicolors
endif

" Set color scheme
colorscheme mine

" Use Ctrl+P to invoke CtrlP plugin
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
