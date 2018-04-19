"Автоматическая установка менеджера плагинов при старте вим
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

set nocompatible " отключить режим совместимости с классическим Vi
"filetype off

let mapleader=","

call plug#begin('~/.vim/plug.vim')
"плагин работы с папками The-Nerd-tree toggle
Plug 'scrooloose/nerdtree'
"плагин цветовой схемы
Plug 'morhetz/gruvbox'
"автоматом ставит вторые пары ( " и т.д.
Plug 'jiangmiao/auto-pairs'
"позволяет . работать со всем
Plug 'tpope/vim-repeat'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
"для git
Plug 'tpope/vim-fugitive'
Plug 'stephpy/vim-yaml', { 'for': 'yaml'  }
call plug#end()

"NerdTreeToggle вызывается с помощью  
"map <c-n> :NERDTreeToggle<cr>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>


"включить нумерацию
set number

"цвет фона
set background=dark

colorscheme gruvbox

"сколько cтрок внизу и вверху экрана показывать при скроллинге
"set scrolloff=3 

"включает поддержку мыши при работе в терминале (без GUI)
"set mouse=a 

"показывать незавершенные команды в статусбаре (автодополнение ввода)
"set showcmd 

"показывать первую парную скобку после ввода второй
set showmatch 

"подсветка синтаксиса 
"syntax on 

"Включаем фолдинг (сворачивание участков кода)
"set foldenable

"Сворачивание по отступам
"set fdm=indent

"пробелы вместо Tab
set expandtab
"4 пробела вместо Tab
set tabstop=4

"подсветка поиска
"set hlsearch
"set incsearch

"функция открытия нового окна 
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
     if (match(a:key,'[jk]'))
        wincmd v
     else
        wincmd s
     endif
     exec "wincmd ".a:key
  endif
endfunction

