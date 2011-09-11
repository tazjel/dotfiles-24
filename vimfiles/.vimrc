"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

" Load pathogen
" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

" Set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set nowrap      "dont wrap lines
set linebreak   "wrap lines at convenient points

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

set encoding=utf8
try
    lang en_US
catch
endtry

"Set mapleader
let mapleader = ","
let g:mapleader = ","

map <Leader>z :ZoomWin<CR>

" Easier non-interactive command insertion
nnoremap <Space> :

" Make it easy to update/reload .vimrc
nmap <leader>s :source ~/.vimrc<CR>
nmap <leader>vi :tabe ~/.vimrc<CR>

" Columns are cooler than rows
noremap ' `
noremap ` '
noremap g' g`
noremap g` g'

" Show line numbers
set number
set numberwidth=3

" Ignore case
set ignorecase
" Case sentisive searching if using uppercase letter
set smartcase

" Don't highlight search matches
" "set nohlsearch

" Jump to end of line in insert mode
imap <C-j> <End>

" ack
set grepprg=ack
set grepformat=%f:%l:%m

nmap <Leader>g :Ack
nmap <Leader>G :AckG

" ZoomWin configuration

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"
let g:snippets_dir = '$HOME/.vim/_snippets/'

" For Haml
au! BufRead,BufNewFile *.haml setfiletype haml

" For Io
au! BufRead,BufNewFile *.io setfiletype io

" For JSON
autocmd BufNewFile,BufRead *.json set ft=javascript

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" For coffee script
au FileType coffee map <buffer> <Leader>j :CoffeeCompile<cr>
au FileType coffee map <buffer> <Leader>h :CoffeeMake<cr>

" Use _ as a word-separator
"set iskeyword-=_

" No Help, please
nmap <F1> <Esc>
map! <F1> <Esc>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Other <F*> binds
nmap <F3> :set paste<CR>
nmap <F4> :set nopaste<CR>
nmap <F5> :GundoToggle<CR>

" map ,d to toggle NERDTree window
nmap <leader>d :NERDTreeToggle<CR>


" open tabs with command-<tab number>
map <D-1> :tabn 1<CR>
map <D-2> :tabn 2<CR>
map <D-3> :tabn 3<CR>
map <D-4> :tabn 4<CR>
map <D-5> :tabn 5<CR>
map <D-6> :tabn 6<CR>
map <D-7> :tabn 7<CR>
map <D-8> :tabn 8<CR>
map <D-9> :tabn 9<CR>

"nmap <leader>v :vsplit<CR> <C-w><C-w>
"nmap <leader>s :split<CR> <C-w><C-w>

map <Leader>rf :CommandTFlush<CR>

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel
map <Leader>c :Rcontroller
map <Leader>v :Rview
"map <Leader>u :Runittest
"map <Leader>f :Rfunctionaltest
"map <Leader>tm :RTmodel
"map <Leader>tc :RTcontroller
"map <Leader>tv :RTview
"map <Leader>tu :RTunittest
"map <Leader>tf :RTfunctionaltest
"map <Leader>sm :RSmodel
"map <Leader>sc :RScontroller
"map <Leader>sv :RSview
"map <Leader>su :RSunittest
"map <Leader>sf :RSfunctionaltest

map <Leader>snip :call ReloadAllSnippets()<CR>
map <Leader>snipc :e ~/.vim/_snippets/coffee.snippets<CR>
map <Leader>snipr :e ~/.vim/_snippets/ruby.snippets<CR>
map <Leader>snipj :e ~/.vim/_snippets/javascript.snippets<CR>
map <Leader>snipa :e ~/.vim/_snippets/_.snippets<CR>

map <Leader>ts :let file_to_run = "<c-r>%"<cr>
" Execute the results of concatenating the strings below. last_run_file is set
" above.
" map <Leader>tt :exe '!ruby -I"test" -I"spec"' file_to_run<cr>

" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb

" NERDTree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
"let NERDTreeIgnore = ['.vim$', '\~$', '.svn$', '\.git$', '.DS_Store', '.sass-cache']
let NERDTreeIgnore = ['\~$', '.svn$', '\.git$', '.DS_Store', '.sass-cache']

"statusline setup
set statusline=%f       "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")
        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest:full   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

"stuff to ignore when tab completing and CommandT
set wildignore=*.o,*.obj,*~,*.scssc,*.sassc,*.png,*.PNG,*.JPG,*.jpg,*.GIF,*.gif,*.dat,*.doc,*.DOC,*.log,*.pdf,*.PDF,*.ppt,*.docx,*.pptx,*.wpd,*.zip,*.rtf,*.eps,*.psd,*.ttf,*.otf,*.eot,*.svg,*.woff,*.mp3,*.mp4,*.m4a,*.wav,"log/**","vendor/**","coverage/**","tmp/**"

set complete-=i

" Tab navigation
nmap <leader>tn :tabnext<CR>
nmap <leader>tp :tabprevious<CR>
nmap <leader>te :tabedit

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"tell the term has 256 colors
set t_Co=256

" set colorscheme
colorscheme jellybeans+

"hide buffers when not displayed
set hidden

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <C-B> :BufExplorer<cr>
let g:bufExplorerShowRelativePath=1

"map to fuzzy finder text mate stylez
"nnoremap <c-f> :FuzzyFinderTextMate<CR>

"nmap <leader>t :FuzzyFinderTextMate<CR>
"let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;*.doc;*.DOC;*.pdf;*.PDF;*.ppt;*.docx;*.pptx;*.wpd;*.zip;*.rtf;*.eps;*.psd;*.ttf;*.otf;vendor/**;coverage/**;tmp/**"
"let g:fuzzy_matching_limit = 40

"alternate command-t invocation
nnoremap <c-f> :CommandT<CR>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"Jump 5 lines when running out of the screen
set scrolljump=5

"Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Sparkup
let g:sparkupExecuteMapping = '<C-S-e>'
let g:sparkupNextMapping = '<C-S-x>'

" jQuery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" subtle red colorcolumn

set colorcolumn=120

highlight ColorColumn ctermbg=red guibg=#261e1e
highlight LineProximity guibg=#212121
highlight LineOverflow guibg=#902020

let w:m1=matchadd('LineProximity', '\%<121v.\%>116v', -1)
let w:m2=matchadd('LineOverflow', '\%>120v.\+', -1)

autocmd VimEnter * autocmd WinEnter * let w:created=1
autocmd VimEnter * let w:created=1

autocmd WinEnter * if !exists('w:created') | let w:m1=matchadd('LineProximity', '\%<121v.\%>116v', -1) | endif
autocmd WinEnter * if !exists('w:created') | let w:m2=matchadd('LineOverflow', '\%>120v.\+', -1) | endif

"set list listchars=tab:>-,trail:.,extends:>
" Enter the middle-dot by pressing Ctrl-k then .M
"set list listchars=tab:\|_,trail::
" Enter the right-angle-quote by pressing Ctrl-k then >>
set list listchars=tab:»·,trail:·
" Enter the Pilcrow mark by pressing Ctrl-k then PI
"set list listchars=tab:>-,eol:¶
" The command :dig displays other digraphs you can use.
highlight SpecialKey guifg=#ffffff guibg=#902020
highlight NonText guifg=#222222
