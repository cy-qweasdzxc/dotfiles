" ---------- 基础设置 ----------
set nocompatible          " 关闭与老旧 Vi 的兼容，启用 Vim 强大特性 [citation:1][citation:7]
filetype plugin indent on " 让 Vim 根据文件类型自动启用插件和缩进规则 [citation:7]
syntax on                 " 开启语法高亮，代码会五颜六色 [citation:1][citation:3]

" ---------- 界面与显示 ----------
set number                " 显示绝对行号
set relativenumber        " 显示相对行号（方便跳转） [citation:1][citation:3]
set cursorline            " 高亮光标所在的那一行 [citation:1][citation:3]
set showcmd               " 在右下角显示你正在输入的命令片段 [citation:7]
set wildmenu              " 命令行补全时，展示一个菜单让你选择 [citation:7]

" ---------- 编辑体验 ----------
set encoding=utf-8        " 内部使用 UTF-8，避免乱码 [citation:1][citation:3]
set backspace=indent,eol,start " 让退格键（Backspace）能正常删除缩进和换行 [citation:7]
set hidden                " 切换文件时，保留当前文件的历史，不强制保存 [citation:1]

" ---------- 缩进与制表符 ----------
set tabstop=4             " 屏幕上一个 Tab 显示为 4 个空格宽
set shiftwidth=4          " 自动缩进时，一次缩进 4 个空格
set expandtab             " 按 Tab 键时，插入真正的空格而非制表符 [citation:1][citation:7]
set autoindent            " 新行自动保持与上一行相同的缩进 [citation:1]

" ---------- 搜索 ----------
set incsearch             " 输入搜索词时，实时高亮匹配结果 [citation:1][citation:7]
set hlsearch              " 搜索后，持续高亮所有匹配项 [citation:1][citation:3]
set ignorecase            " 搜索时忽略大小写
set smartcase             " 如果搜索词包含大写，则自动转为区分大小写 [citation:1][citation:7]

" ---------- 快捷键映射 ----------
nnoremap <C-s> :w<CR>     " 在普通模式下，按 Ctrl+s 保存文件 [citation:3]
inoremap <C-s> <Esc>:w<CR>a " 在插入模式下，按 Ctrl+s 保存并返回插入模式 [citation:3]
" system runtime files -- /usr/share/vim/vim<version>.
"
" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
"
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1
"
" If you would rather _use_ default.vim's settings, but have the system or
" user vimrc override its settings, then uncomment both lines below (to load
" the settings now but prevent it from being loaded by the user's vimrc).
" source $VIMRUNTIME/defaults.vim
" let g:skip_defaults_vim = 1

" All Debian-specific settings are defined in $VIMRUNTIME/debian.vim and
" sourced by the call to :runtime you can find below.  If you wish to change
" any of those settings, you should do it in this file or
" /etc/vim/vimrc.local, since debian.vim will be overwritten everytime an
" upgrade of the vim packages is performed. It is recommended to make changes
" after sourcing debian.vim so your settings take precedence.

runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes
" numerous options, so any other options should be set AFTER changing
" 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

