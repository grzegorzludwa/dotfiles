if exists('g:started_by_firenvim')
  set laststatus=0
else
  set laststatus=2
endif

let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https?://overleaf.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://facebook.*'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://tinkercad.*'] = { 'takeover': 'never', 'priority': 1 }
