" INSTALLATION NOTES
  " For command.t to run you need to run following command in this dir:
  " ~/.vim/plugged/command-t/ruby/command-t/ext/command-t
  " make clean; ruby extconf.rb && make "
          " For youcompletme run this in directory
  "  ~/.vim/plugged/youcompletme/./install.py --clang-completer
  "  Run after :PlugInstall in vim and you should be ready to go.
  " For Ultisnip:
  " mkdir -p ~/.vim/ftdetect/
  " ln -s ~/.vim/plugged/ultisnips ~/.vim/ftdetect/
" PLUGINS
  call plug#begin('~/.vim/plugged')
  " Fugtive
    Plug 'https://github.com/tpope/vim-fugitive.git'
    Plug 'https://github.com/tpope/vim-repeat.git'
    Plug 'https://github.com/tpope/vim-rhubarb.git' 
    Plug 'https://github.com/tpope/vim-unimpaired.git'
    Plug 'https://github.com/tpope/vim-surround.git'
    Plug 'https://github.com/tpope/vim-commentary.git'  
  " Django
    Plug 'python-mode/python-mode', { 'branch': 'develop' }
    Plug 'JarrodCTaylor/vim-python-test-runner'
    Plug 'https://github.com/plytophogy/vim-virtualenv.git'
  " File managers
    Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
    Plug 'francoiscabrol/ranger.vim' 
    Plug 'rstacruz/sparkup', {'rtp': '.vim/'}
    Plug 'https://github.com/jremmen/vim-ripgrep.git' 
    Plug 'git://git.wincent.com/command-t.git' 
  " Linting 
    Plug 'https://github.com/textlint/textlint-plugin-html'
    Plug 'https://github.com/rhysd/vim-grammarous.git'
  " Beautify
    Plug 'maksimr/vim-jsbeautify'
  " Tools
    " On-demand lazy load
    Plug 'mtth/scratch.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'airblade/vim-gitgutter'
    Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plug 'https://github.com/Valloric/YouCompleteMe.git'
    Plug 'https://github.com/mbbill/undotree'
    Plug 'christoomey/vim-system-copy'
    Plug 'christoomey/vim-quicklink'
    Plug 'https://github.com/yuratomo/w3m.vim.git'
    Plug 'mattn/webapi-vim'
    Plug 'https://github.com/editorconfig/editorconfig-vim.git'
  " Documents
    Plug 'https://github.com/suan/vim-instant-markdown.git'
    Plug 'xuhdev/vim-latex-live-preview'
  " Colors/Appearance/Indentation
    Plug 'https://github.com/dylanaraps/wal.vim.git'
    Plug 'https://github.com/ap/vim-css-color.git' 
    Plug 'https://github.com/Glench/Vim-Jinja2-Syntax.git'
    Plug 'https://github.com/lepture/vim-jinja'
    Plug 'flazz/vim-colorschemes'
  " Snipamte/Emmet
    Plug 'https://github.com/SirVer/ultisnips.git'
    Plug 'honza/vim-snippets'
    Plug 'https://github.com/mattn/emmet-vim.git'
  call plug#end()
" CUSTOM FUNCTIONS
  " 
  fun! Browseoldfiles()
  bd
  vnew  +setl\ buftype=nofile | 0put =v:oldfiles | nnoremap <buffer> <cr> :e <c-r>=getline('.')<cr><cr> 
  se ro
  normal gg
  setlocal nobuflisted
  endf
" BINDINGS
    let mapleader = "\<space>"
  " Sessions
    nnoremap <leader>ss :source session.vim <cr> <bar> :source ~/.vimrc<cr>
    nnoremap <leader>sm :mksession! session.vim<cr>
  " Windows  
    nnoremap <leader>w0 :vertical resize +20<cr>
    nnoremap <leader>w9 :vertical resize -20<cr>
    nnoremap <leader>wq :wq <cr>
  " File mappings 
    nnoremap <leader>fo :call Browseoldfiles() <cr>
    nnoremap <leader>fw :w <cr>
    nnoremap <leader>fW :w! <cr>
    nnoremap <leader>fWa :wa! <cr>
    nnoremap <leader>fq :q! <cr> 
    nnoremap <leader>fqa :qa! <cr> 
    nnoremap <leader>fq :q <cr> 
    nnoremap <leader>fb :0,$d <bar> 0 r !js-beautify -s 2 -m 1 %
    nnoremap <leader>fp :PymodeLintAuto<cr>
    nnoremap <leader>fn :vnew <cr>
    nnoremap <leader>fnv :split new <cr>
    nnoremap <leader>ffv <cr>  :cd ~/.vim/ <bar>:e ~/.vim/.vimrc <cr>
    nnoremap <leader>ffb :e	~/.bash_profile <cr>
" PLUGGINS BINDINGS
  " Which key
  
    function UnmapPluginsBindings()
    if ! empty(maparg('<leader>b', 'n')) 
    unmap <leader>b
    endif
    if ! empty(maparg('<leader>d', 'n')) 
    unmap <leader>d
    endif
    endf set timeoutlen=0
    nnoremap <silent> <leader> :call UnmapPluginsBindings() <bar> :WhichKey '<Space>'<CR>
    let g:which_key_map =  {}
    let g:which_key_map.f = { 'name' : '+file' }
    let g:which_key_map.f.f = { 'name' : 'file paths' }
    let g:which_key_map.f.Q = { 'name' : 'quit' }
    let g:which_key_map.h = { 'name' : '+hunk' }
    let g:which_key_map.g = { 'name' : '+git' }
    let g:which_key_map.w = { 'name' : 'window' }
    let g:which_key_map.s = { 'name' : 'session' }
    let g:which_key_map.y = { 'name' : 'ycm' }
    let g:which_key_map.d= {
      \ 'name' : '+Django' ,
      \ 'c' : ['DjangoTestClass'        , 'test class']        ,
      \ 'a' : ['DjangoTestApp'        , 'test app']        ,
      \ }
    let g:which_key_map.b= {
    \ 'name' : '+buffer' ,
    \ 'b' : ['<Plug>(CommandTBuffer)'        , 'Command-t' ]        ,
    \ '1' : ['b1'        , 'buffer 1']        ,
    \ '2' : ['b2'        , 'buffer 2']        ,
    \ 'd' : ['bd'        , 'delete-buffer']   ,
    \ 'D' : ['bd!'       , 'delete-buffer']   ,
    \ 'f' : ['bfirst'    , 'first-buffer']    ,
    \ 'h' : ['Startify'  , 'home-buffer']     ,
    \ 'l' : ['blast'     , 'last-buffer']     ,
    \ 'n' : ['bnext'     , 'next-buffer']     ,
    \ 'p' : ['bprevious' , 'previous-buffer'] ,
    \ '?' : ['Buffers'   , 'fzf-buffer']      ,
    \ }
    autocmd! User vim-which-key call which#register('<Space>', 'g:which_key_map')
    call which_key#register('<Space>', "g:which_key_map")
    " nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
    " vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
    
  " Command-t
    " nmap <silent> <Leader>t <Plug>(CommandT)
    " nmap <silent> <Leader>b <Plug>(CommandTBuffer)
    "	nmap <silent> <Leader>j <Plug>(CommandTJump)
  " Git mappings
    nnoremap <leader>go :Gbrowse<CR>
    nnoremap <leader>gi :e .gitignore<CR>
    nnoremap <leader>ga :Git add %<CR><CR>
    nnoremap <leader>gr :Git reset -- % <CR><CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gs :Gstatus<CR> <bar> :wincmd L <cr>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gl :Glog<CR>
    nnoremap <leader>gc :Gcommit -m ""
    nnoremap <leader>gp :Gpush<CR>
  " Django
    nnoremap <Leader>de :cclose<cr>
    nnoremap <Leader>dc :DjangoTestClass<CR>
    nnoremap <Leader>dm :DjangoTestMethod<CR>
    nnoremap <Leader>do :copen <bar> :wincmd L <CR>
    nnoremap <Leader>da :DjangoTestApp<CR><bar> :cclose <cr> <bar> :copen <cr> <bar> :wincmd L <CR>
    nnoremap <Leader>df :DjangoTestFile<CR><bar> :cclose <cr>
  " Gutter 
    nmap ]h <Plug>GitGutterNextHunk
    nmap [h  <Plug>GitGutterPrevHunk
  " Nerdtree
    map <leader>fN  :NERDTreeFocus<cr>R<c-w>h<c-p>
    map <leader>fn :NERDTreeToggle<cr>
          map <leader>fr  :Ranger<cr>
  " Ycm	
    nnoremap <leader>yi :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>yh :YcmCompleter GetDoc <cr>
  " Ultisnips
    let g:UltiSnipsExpandTrigger="<c-space>"
    let g:UltiSnipsJumpForwardTrigger="<c-l>"
    let g:UltiSnipsJumpBackwardTrigger="<c-h>"
          " If you want :UltiSnipsEdit to split your window.
  " Undotree
    nnoremap <leader>u :UndotreeToggle<cr>
"PLUGGINS SETTINGS
  " Scratch
    let g:secratch_persistence_file = '.scratch.vim'
    let g:scratch_no_mappings = 1
  " NerdTree
    let NERDTreeShowHidden=1
  " Ultisnips
    set runtimepath+=~/.vim/plugged/ultisnips
    let g:UltiSnipsEditSplit="vertical"
          " let g:UltiSnipsSnippetsDir =  '~/.im/plugged/vim-snippets/custom_snips/'
    let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets/snippets',]
  " Command-t
    let g:CommandTCancelMap='<Esc>'
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.tmp/*,*/.sass-cache/*,*/node_modules/*,*.keep,*.ds_store,*/.git/*,*.pyc,/__pycache__
  " Ranger
          " Disable default key
    let g:ranger_map_keys = 0
  " Fugitive
          " clean buffers from fugitive
    autocmd bufreadpost fugitive://* set bufhidden=delete
  " Gutter 
    set updatetime=100
  " Powerline
    set laststatus=2
  " Python mode
    " Autopep on save
    au BufWriteCmd *.py write || :PymodeLintAuto
    " au BufWriteCmd *.py write || :PymodeLint
    let g:pymode_breakpoint = 0
    let g:pymode_breakpoint_bind = '<leader>pb'
    let g:pymode_lint = 1
    let g:pymode_lint_on_fly = 1
    let g:pymode_lint_ignore = ["E501"]
    let g:pymode_virtualenv = 1
    let g:pymode_rope_completion_bind = '<c-space>'
  " You complete me
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_auto_trigger = 1
    " let g:ycm_key_invoke_completion = '<C-Space>'
" VIM SETTINGS
 " Tabs
    set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
  " Search
    " When selecting a parenthesis it will highlight the one matching:
    set showmatch
    set incsearch
    set ignorecase
    set nohls
  " When opening new files don't close them but keep them in buffers
    set hidden
  " Reloading vim
    autocmd! BufWritePost ~/.vimrc nested :source $HOME/.vimrc
    nnoremap <leader>rv :source $HOME/.vimrc <cr>
  " Autocompletion
    set wildmenu	
  " Spell checking
    autocmd bufread,bufnewfile *.md setlocal spell
    autocmd bufread,bufnewfile *.tmp setlocal spell
    autocmd filetype gitcommit setlocal spell
  " Syntax and lines
    set nowrap
    set relativenumber " show relative number, instead of normal line numbers
    set number " line number
  " Colors/Appearance 
    syntax on
    colorscheme wal
    set background=light
    highlight Pmenu ctermbg=gray 
    highlight statusline ctermfg=yellow 
  " Persistent undo
    if has('persistent_undo')    "check if your vim version supports it
    set undofile                 "turn on the feature  
    set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
    endif     
  " Windows
    " Help window on right
    autocmd FileType help wincmd L
    autocmd FileType snippets wincmd L
