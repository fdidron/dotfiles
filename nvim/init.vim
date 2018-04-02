"Set leader
:let mapleader = " "

"Custom Key map
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>s :sp<CR>
nnoremap <Leader>v :vsp<CR>
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>b :Buffers<CR>

"No arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Better split opening behavior
set splitbelow
set splitright

"General options
set relativenumber
set list listchars=tab:\ \ ,trail:·
set hidden

"Indentation
filetype plugin indent on
syntax on
set expandtab
set tabstop=2
set shiftwidth=2

"Autocommands
if has("autocmd")
  " Automatically clean trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e
  " Run prettier on save
  let g:prettier#autoformat = 0
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
  autocmd BufEnter * silent! lcd %:p:h
  autocmd FileType go setlocal shiftwidth=4 tabstop=4

endif

"StatusLine

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  ⎇  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

"--- VimPlug
call plug#begin()
"UI
  Plug 'luochen1990/rainbow'
  Plug 'chriskempson/base16-vim'
  Plug 'trevordmiller/nova-vim'

"File Navigation
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'francoiscabrol/ranger.vim'

"Task runners
  Plug 'w0rp/ale'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Git
  Plug 'tpope/vim-fugitive'

"Search
  Plug 'haya14busa/incsearch.vim'

"Autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
  Plug 'ervandew/supertab'

" Language Support
" Snippets
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
" JavaScript
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Go
  Plug 'fatih/vim-go'
" Less
  Plug 'groenewege/vim-less'

" Gherkin
  Plug 'chr15m/vim-gherkin'

" Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
call plug#end()

"--- Plugin conf

"Colorscheme
syntax enable
set termguicolors
set background=dark
colorscheme base16-solarflare
let g:rainbow_active = 1

"Linting / Fixing
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

"Autocomplete
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:SuperTabClosePreviewOnPopupClose = 1

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

"Open ranger when opening a directory
let g:ranger_replace_netrw = 1

"Incsearch setup
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
