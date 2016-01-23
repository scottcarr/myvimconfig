set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader=" "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
"
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline'
Plugin 'octol/vim-cpp-enhanced-highlight' 
Plugin 'flazz/vim-colorschemes'
Plugin 'wincent/command-t'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'

"rust
Plugin 'rust-lang/rust.vim'
"Plugin 'racer-rust/vim-racer'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'davidhalter/jedi-vim'
" Plugin 'taglist.vim'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'

" ULTISNIPS
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<leader>s"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

" COLORS
colorscheme railscasts

" YOUCOMPLETEME
nnoremap <leader>j :YcmCompleter GoTo<CR>
nnoremap <leader>f :YcmCompleter GoToDefinition<CR>
nnoremap <leader>c :YcmCompleter GoToDeclaration<CR>

let g:ycm_filetype_whitelist = { 
        \ 'c': 1,
        \ 'cpp': 1,
        \ 'h': 1,
        \ 'hpp': 1,
        \ 'cc': 1,
        \ 'py': 1
        \}
let g:ycm_extra_conf_globlist = [
        \ '~/llvmTutorial/*', 
        \ '~/scratch/*', 
        \ '~/sunblaze-ucb/hacking/*', 
        \ '~/sunblaze-ucb/*', 
        \ '!~/llvm/*',
        \ '!~/dataconf/inf_test/*',
        \ '!~/dataconf/test/*',
        \ '~/hacking/*',
        \ '~/portable/*',
        \ '~/data-integrity/fcfi-llvm/*',
        \ '~/dataconf/llvm/*',
        \ '~/vt/*',
        \ '~/dataconf/dataconf/*',
        \ '~/tanuki-workspace/*',
        \ '~/dataconf-workspace2/*'
        \]
"let g:ycm_confirm_extra_conf = 0

" GENERAL
filetype plugin on
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
"set autochdir
set rnu
set cursorline
set foldmethod=syntax
set foldlevel=99
if has("gui_running")
  if has("gui_gtk2")
    "set guifont=Inconsolata\ 10
    set guifont=Andale\ Mono\ 10
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue

" status line junk
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2 

let $LABNOTES="~/LabNoteBook/notes.md"

autocmd InsertEnter * hi Cursorline ctermbg=236
autocmd InsertLeave * hi Cursorline ctermbg=9

autocmd FileType mkd set wrap
autocmd FileType mkd set textwidth=80
autocmd FileType mkd set foldmethod=manual
autocmd FileType mkd set foldlevel=99

autocmd FileType tex set wrap
autocmd FileType tex set textwidth=80
autocmd FileType tex set spell

autocmd FileType text set wrap
autocmd FileType text set textwidth=80
autocmd FileType text set spell

autocmd FileType c set foldmethod=syntax
autocmd FileType c++ set foldmethod=syntax

autocmd BufNewFile,BufRead * set makeprg=make
autocmd BufNewFile,BufRead */dataconf/dataconf/* set makeprg=make\ -j8\ -C\ ../build\ LLVMDataConf
autocmd BufNewFile,BufRead */data-integrity/fcfi-llvm/* set makeprg=make\ -j8\ -C\ ../build 
"autocmd BufNewFile,BufRead */dataconf-workspace2/* set makeprg=make\ -C\ ../build 
"autocmd BufNewFile,BufRead */dataconf-workspace2/* set makeprg=ninja\ -C\ ../buildNinja\ clang
autocmd BufNewFile,BufRead */dataconf-workspace2/* set makeprg=ninja\ -C\ ../buildShared
autocmd BufNewFile,BufRead */vt/vt-llvm/* set makeprg=make\ -j8\ -C\ ../build 

set incsearch
nnoremap <leader>h :set hlsearch! <CR>

nnoremap <leader>t :CommandT .<CR>

nnoremap <leader>l :tselect 

nnoremap <leader>m :make 

inoremap <Del> <Esc>
nnoremap <Del> <Esc>

let g:ycm_rust_src_path = '/Users/scott/rust'
