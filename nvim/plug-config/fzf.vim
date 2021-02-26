map <C-p> :Files<CR>
" map <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap <leader>m :Marks<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $fzf_default_opts='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}
