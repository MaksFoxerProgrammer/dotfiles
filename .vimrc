
" ██████╗ ██╗     ███████╗     ██╗██╗  ██╗ █████╗ ██╗     ██╗██╗   ██╗███████╗
"██╔═══██╗██║     ██╔════╝     ██║██║ ██╔╝██╔══██╗██║     ██║██║   ██║██╔════╝
"██║   ██║██║     █████╗       ██║█████╔╝ ███████║██║     ██║██║   ██║█████╗  
"██║   ██║██║     ██╔══╝  ██   ██║██╔═██╗ ██╔══██║██║     ██║╚██╗ ██╔╝██╔══╝  
"╚██████╔╝███████╗███████╗╚█████╔╝██║  ██╗██║  ██║███████╗██║ ╚████╔╝ ███████╗
" ╚═════╝ ╚══════╝╚══════╝ ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚══════╝
"
"Config file for Vim                    https://gitlab.com/olejkalive/dotfiles

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
syntax on
"Сам по себе number показывает справа номера строк
"relativenumber - нумерацию строк относительно положения курсора
set number relativenumber "А это гибридный вариант. Протестируйте все

set noerrorbells
set novisualbell

"Мышка
set mouse=a

"Более удобное перемещение между открытыми вкладками редактора:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Попытка решения проблемы копирования текста в ситемн. буфер обмена
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

"Поиск игнорируя регистр, + подсветка
set ignorecase
set smartcase
set hlsearch
set incsearch

""Использовать, при проблеме с кодировкой, и переносами
"set encoding=utf8
"set ffs=unix,dos,mac


"Теперь плагины...
filetype plugin indent on "Включает определение типа файла, загрузку...
"... соответствующих ему плагинов и файлов отступов
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
syntax enable "Включает подсветку синтаксиса

if empty(glob('~/.vim/autoload/plug.vim')) "Если vim-plug не стоит
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs "Создать директорию
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  "И скачать его оттуда
  "А после прогнать команду PlugInstall, о которой мы сейчас поговорим
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""


call plug#begin('~/.vim/bundle') "Начать искать плагины в этой директории
"Тут будут описаны наши плагины
Plug 'ErichDonGubler/vim-sublime-monokai' "Добавьте это в список плагинов
Plug 'vim-airline/vim-airline' "В список плагинов
Plug 'lyokha/vim-xkbswitch'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips' 
call plug#end() "Перестать это делать



"""""""""""""""""""""""""""""""""""""""""""""""""""


"https://habr.com/ru/post/468265/
colorscheme sublimemonokai "Добавьте это НЕ в список плагинов
"Не в список плагинов
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу



"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap...
"... но переносит строчки не посимвольно, а по словам



"Предыдущий способ известен как soft wrapping
"При желании вы можете заставить Вим насильно разделять...
"... строчки в самом тексте вот так:
"set textwidth=80 "Где 80 стоит заменить на нужную вам длину строки



set cursorline "А так мы можем подсвечивать строку с курсором




"Если вы используете обычный терминальный Вим, а не NeoVim, то...
"... для изменения курсора в разных режимах используйте это:
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта



"Чтоб... Короче надо это. Не спрашивай.
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


"Базовый конфиг LaTex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1 " Маскировка
let g:tex_conceal='abdmg' " Маскировка




" ============================================================
" ============================================================
" ============================================================


"Конфиг сниппетов для LaTex
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'















