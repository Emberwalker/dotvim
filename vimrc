" vim: set foldmarker=[[,]] foldlevel=0 foldmethod=marker:

" setup & vundle [[
    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
" ]]

" bundles [[
    " bundles: core [[
        Bundle 'gmarik/vundle'
        Bundle 'MarcWeber/vim-addon-mw-utils'
        Bundle 'tomtom/tlib_vim'
    " ]]

    " bundles: plugins [[
        Bundle 'kien/ctrlp.vim'
        Bundle 'Lokaltog/vim-powerline'
        Bundle 'Lokaltog/vim-easymotion'
        "Bundle 'myusuf3/numbers.vim'
        Bundle 'tpope/vim-fugitive'
        Bundle 'tpope/vim-surround'
        Bundle 'tpope/vim-repeat'
        Bundle 'scrooloose/syntastic'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'scrooloose/nerdtree'
        Bundle 'paradigm/vim-multicursor'

        Bundle 'mileszs/ack.vim'
        Bundle 'sjl/gundo.vim'
        Bundle 'vim-scripts/vimwiki'
        Bundle 'vim-scripts/bufkill.vim'
        Bundle 'vim-scripts/buftabs'
        Bundle 'kshenoy/vim-signature'
        Bundle 'godlygeek/tabular'

        Bundle 'mattn/zencoding-vim'
        Bundle 'mattn/webapi-vim'
        Bundle 'mattn/gist-vim'

        Bundle 'Shougo/vimproc'
        Bundle 'Shougo/vimshell'

        if executable('ctags')
            Bundle 'majutsushi/tagbar'
        endif
    " ]]

    " autocomplete [[
        "Bundle 'garbas/vim-snipmate'
        "Bundle 'ervandew/supertab'

        Bundle 'Shougo/neocomplcache'
        Bundle 'Shougo/neosnippet'

        Bundle 'honza/snipmate-snippets'
    " ]]

    " bundles: color schemes [[
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'vim-scripts/Colour-Sampler-Pack'
    " ]]

    " bundles: languages [[
        Bundle 'pangloss/vim-javascript'
        Bundle 'groenewege/vim-less'
        Bundle 'mmalecki/vim-node.js'
        Bundle 'leshill/vim-json'
        Bundle 'tpope/vim-markdown'
        Bundle 'cakebaker/scss-syntax.vim'
        Bundle 'hail2u/vim-css3-syntax'
        Bundle 'ap/vim-css-color'
        Bundle 'maksimr/vim-jsbeautify'
    " ]]
" ]]

" base configuration [[
    filetype on
    filetype plugin on
    filetype indent on
    syntax enable

    set timeoutlen=200                                  "time to wait between key presses
    set mouse=a                                         "enable mouse
    set mousehide                                       "hide when characters are typed
    set history=1000
    set ttyfast                                         "assume fast terminal connection
    set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility
    set encoding=utf-8                                  "set encoding for text
    set clipboard=unnamed                               "sync with OS clipboard
    set hidden                                          "allow buffer switching without saving
    "set spell                                           "i can haz spelling?
    set autoread                                        "auto reload if file saved externally
    set shell=zsh

    " whitespace
    set backspace=indent,eol,start                      "allow backspacing everything in insert mode
    set autoindent                                      "automatically indent to match adjacent lines
    set smartindent                                     "smart indenting for additional languages
    set expandtab                                       "spaces instead of tabs
    set tabstop=4                                       "number of spaces per tab for display
    set softtabstop=4                                   "number of spaces per tab in insert mode
    set shiftwidth=4                                    "number of spaces when indenting
    set virtualedit=onemore                             "allow cursor one beyond end of line
    set list                                            "highlight whitespace
    set listchars=tab:▸\ ,trail:.,extends:#,nbsp:.      "highlight problematic whitespace

    set showmatch                                       "automatically highlight matching braces/brackets/etc.
    set foldenable                                      "enable folds by default
    set scrolloff=10                                    "always show content after scroll
    set scrolljump=5                                    "minimum number of lines to scroll

    " disable sounds
    set noerrorbells
    set novisualbell
    set t_vb=

    " searching
    set hlsearch                                        "highlight searches
    set incsearch                                       "incremental searching
    set ignorecase                                      "ignore case for searching
    set smartcase                                       "do case-sensitive if there's a capital letter

    " windows
    "set winwidth=150                                    "suggested window width
    "set winheight=10                                    "dummy setting to match winminheight
    "set winminheight=10                                 "the minimum height for any window
    "set winminwidth=10                                  "the minimum width for any window
    "set winheight=999                                   "the suggest height for any window

    set wildmenu                                        "show list for autocomplete
    set wildmode=list:longest:full                      "priority for tab completion
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*

    " persistent undo
    set undofile
    set undodir=~/.vim/undo

    " backups
    set backup
    set backupdir=~/.vim/backup
    set directory=~/.vim/swap
" ]]

" ui configuration [[
    let g:solarized_contrast="high"
    let g:solarized_termcolors=256
    let g:solarized_visibility="high"

    if has('gui_running')
        " maximize
        set lines=999
        set columns=999

        if has('gui_macvim')
            set gfn=Envy_Code_R_VS:h13
        endif

        if has('gui_win32')
            set gfn=Envy_Code_R_VS:h10
        endif

        colorscheme molokai
    else
        set t_Co=256
        set number

        " difference cursors for insert vs normal mode
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"

        colorscheme molokai
    endif

    set background=dark                                 "assume dark background
" ]]

" plugin configuration [[

    " nerdtree [[
        let NERDTreeShowHidden=1
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowLineNumbers=1
        let NERDTreeChDirMode=0
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.git','\.hg']
    " ]]

    " syntastic [[
        let g:syntastic_error_symbol = '✗'
        let g:syntastic_style_error_symbol = '✠'
        let g:syntastic_warning_symbol = '∆'
        let g:syntastic_style_warning_symbol = '≈'
    " ]]

    " ctrlp [[
        let g:ctrlp_cmd = 'CtrlPMixed'
        let g:ctrlp_by_filename=1
        "let g:ctrlp_clear_cache_on_exit=0
        let g:ctrlp_max_height=15
        let g:ctrlp_max_files=2000
        let g:ctrlp_show_hidden=1
        let g:ctrlp_follow_symlinks=1
        let g:ctrlp_working_path_mode=0
        let g:ctrlp_cache_dir = $HOME.'/.vim/cache/ctrlp'
    " ]]

    " powerline settings [[
        set laststatus=2
    " ]]

    " buftabs [[
        let g:buftabs_only_basename=1
    " ]]

    " vimshell [[
        let g:vimshell_editor_command="/usr/local/bin/vim"
    "]]

    " neocomplcache [[
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_max_list = 15
        let g:neocomplcache_force_overwrite_completefunc = 1
        let g:neocomplcache_max_menu_width = 999
        "let g:neocomplcache_auto_completion_start_length=1

        " Proper tab completion
        imap <silent><expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" :
            \ (pumvisible() ? "\<C-n>" : "\<TAB>")
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                    \ "\<Plug>(neosnippet_expand_or_jump)"
                    \: "\<TAB>"

        " Define dictionary
        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

        " Define keyword
        if !exists('g:neocomplcache_keyword_patterns')
            let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns._ = '\h\w*'

        " Plugin key-mappings
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
        inoremap <expr><C-g> neocomplcache#undo_completion()
        inoremap <expr><C-l> neocomplcache#complete_common_string()
        inoremap <expr><CR> neocomplcache#complete_common_string()

        " <TAB>: completion
        "inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

        " <CR>: close popup
        " <s-CR>: close popup and save indent.
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
        inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y> neocomplcache#close_popup()

        " Enable omni completion
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

        " Enable heavy omni completion
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

        " use honza's snippets
        let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
        let g:neosnippet#enable_snipmate_compatibility=1

        " For snippet_complete marker
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
    " ]]
" ]]

" functions [[
    function! Preserve(command)
        " preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        execute a:command
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction

    function! StripTrailingWhitespace()
        call Preserve("%s/\\s\\+$//e")
    endfunction

    function! InitFolders()
        let folder = $HOME . '/.vim/backup'
        if !isdirectory(folder)
            call mkdir(folder)
        endif
        let folder = $HOME . '/.vim/swap'
        if !isdirectory(folder)
            call mkdir(folder)
        endif
        let folder = $HOME . '/.vim/undo'
        if !isdirectory(folder)
            call mkdir(folder)
        endif
    endfunction
    call InitFolders()
" ]]

" autocmd [[
    autocmd FileType js,scss,css autocmd BufWritePre <buffer> call StripTrailingWhitespace()

    au WinLeave * set nocursorline
    "au WinLeave * set nocursorcolumn

    au WinEnter * set cursorline
    "au WinEnter * set cursorcolumn

    "automatically close quick-fix on select
    "autocmd FileType qf nmap <buffer> <cr> <cr>:ccl<cr>
" ]]

" mappings [[
    let mapleader = ","
    let g:mapleader = ","

    " formatting shortcuts
    nmap <leader>fef :call Preserve("normal gg=G")<CR>
    nmap <leader>f$ :call StripTrailingWhitespace()<CR>
    nmap <leader>fjs :call JsBeautify()<CR>

    " remap arrow keys [[
        nnoremap <up> :tabnext<CR>
        nnoremap <down> :tabprev<CR>
        nnoremap <left> :bprev<CR>
        nnoremap <right> :bnext<CR>
        inoremap <up> <nop>
        inoremap <down> <nop>
        inoremap <left> <nop>
        inoremap <right> <nop>
    " ]]

    " screen line scroll
    nnoremap j gj
    nnoremap k gk

    " reselect visual block after indent
    vnoremap < <gv
    vnoremap > >gv

    " shortcuts for split screen
    nnoremap <leader>v <C-w>v<C-w>l
    nnoremap <leader>s <C-w>s
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " tab shortcuts [[
        map <leader>tn :tabnew<CR>
        map <leader>tc :tabclose<CR>
        map <leader>t0 0gt
        map <leader>t1 1gt
        map <leader>t2 2gt
        map <leader>t3 3gt
        map <leader>t4 4gt
        map <leader>t5 5gt
        map <leader>t6 6gt
        map <leader>t7 7gt
        map <leader>t8 8gt
        map <leader>t9 9gt
    " ]]

    " nerdtree
    map <leader>ee :NERDTreeToggle<CR>
    map <leader>ef :NERDTreeFind<CR>

    " fugitive [[
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
    " ]]

    " tagbar
    nnoremap <silent> <F9> :TagbarToggle<CR>

    " gundo
    nnoremap <silent> <F5> :GundoToggle<CR>

    " ctrlp
    map <leader>p :CtrlPBufTag<cr>

    " multicursor
    nnoremap _ :<c-u>call MultiCursorPlaceCursor()<cr>
    nnoremap __ :<c-u>call MultiCursorManual()<cr>
    let g:multicursor_quit = "<C-c>"

    " nerdcommenter
    map \\ <plug>NERDCommenterToggle

    " general
    map <leader>a :Ack 
    nmap <leader>l :set list!<cr>
    noremap <space> :set hlsearch! hlsearch?<cr>
" ]]

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

