set nocompatible              " be iMproved, required
filetype off                  " required

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

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" ULTISNIPS
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

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
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>

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
        \ '~/hacking/*',
        \ '~/data-integrity/fcfi-llvm/*',
        \ '~/dataconf/*'
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

autocmd FileType tex set wrap
autocmd FileType tex set textwidth=80
autocmd FileType tex set spell

autocmd BufNewFile,BufRead * set makeprg=make
autocmd BufNewFile,BufRead */dataconf/llvm/* set makeprg=make\ -j8\ -C\ ../build

