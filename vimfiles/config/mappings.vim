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

" Jump to end of line in insert mode
imap <C-j> <End>

" Make Q useful and avoid the confusing Ex mode.
noremap Q <nop>
" Close window.
noremap QQ :q<CR>
" Close a full tab page.
noremap QW :windo bd<CR>
" Close all.
noremap QA :qa<CR>
" Close, damn you!
noremap Q! :q!<CR>

" Yank to OS X pasteboard.
noremap <leader>y "*y

" Paste from OS X pasteboard without messing up indent.
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>

" Default searches to "very magic", more like the world outside Vim.
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Select the text that was last edited/pasted.
" http://vimcasts.org/episodes/bubbling-text/
nmap gV `[v`]

" Smart way to move between windows
nmap <S-j> <C-W>j
nmap <S-k> <C-W>k
nmap <S-h> <C-W>h
nmap <S-l> <C-W>l

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

" Shift + left/right to switch tabs.
noremap <S-Left> :tabp<CR>
noremap <S-Right> :tabn<CR>

if has("gui_macvim") && has("gui_running")
" Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif

" Tab navigation
nmap <leader>tn :tabnext<CR>
nmap <leader>tp :tabprevious<CR>
nmap <leader>te :tabedit

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map Q to something useful
noremap Q gq

"make Y consistent with C and D
nnoremap Y y$

"nmap <leader>v :vsplit<CR> <C-w><C-w>
"nmap <leader>s :split<CR> <C-w><C-w>

" Open URL from this line (OS X only).
map <leader>u :call OpenURI()<CR>

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv
