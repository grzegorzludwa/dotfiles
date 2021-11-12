source $HOME/.config/nvim/general/settings.vim
"source $HOME/.config/nvim/keys/mappings.vim

" Install vim-plug if not found
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'

endif
unlet autoload_plug_path

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-commentary'                         " for autocomment lines
Plug 'unblevable/quick-scope'                       " for highlight unique characters in line
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-scripts/DoxygenToolkit.vim'               " for doxygen support


Plug 'vim-airline/vim-airline'                      " for bottom status line

Plug 'tpope/vim-fugitive'                           " for git integration
Plug 'puremourning/vimspector'                      " for debugging

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'preservim/nerdtree'                           " file explorer
Plug 'mbbill/undotree'                              " tree with last changes
Plug 'gruvbox-community/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'

" Plug 'jiangmiao/auto-pairs'                         " for auto brackets and quotes
" Plug 'mhinz/vim-startify'                           " let us manage our sessions very easily
" To run nvim inside browser
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(69) } }
" Plug 'vuciv/vim-bujo'                               " Todo menu
" Plug 'vim-utils/vim-man'                            " view man pages in vim
" Plug 'tpope/vim-dispatch'                           " honestly I'm not sure what it is doing
" Plug 'theprimeagen/vim-be-good'                     " games to speed up vim movement

"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO

Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

call plug#end()

colorscheme gruvbox

"filetype specific settings
autocmd Filetype cpp setlocal ts=4 sw=4 tw=140 expandtab colorcolumn=140
autocmd Filetype c setlocal ts=4 sw=4 tw=140 expandtab colorcolumn=140
autocmd Filetype markdown setlocal tw=79 colorcolumn=79
autocmd Filetype rst setlocal tw=79 colorcolumn=79
autocmd Filetype cmake setlocal tw=79 colorcolumn=79
autocmd Filetype tex setlocal tw=80 colorcolumn=80
autocmd Filetype python setlocal tw=79 colorcolumn=79

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <F2> gT<CR>
nnoremap <F3> gt<CR>

" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Better indenting
vnoremap > >gv
vnoremap < <gv

source $HOME/.config/nvim/plug-config/quick-scope.vim
source $HOME/.config/nvim/plug-config/vim-comentary.vim
source $HOME/.config/nvim/plug-config/markdown-preview.vim
source $HOME/.config/nvim/plug-config/doxygen-toolkit.vim
source $HOME/.config/nvim/plug-config/firenvim.vim
source $HOME/.config/nvim/plug-config/vim-airline.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/nerdtree.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/coc.vim

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'
