set nocompatible           " Vim defaults rather than vi ones. Keep at top.
filetype plugin indent on  " Enable filetype-specific settings.
syntax on                  " Enable syntax highlighting.
colorscheme delek          " Select colorscheme
set backspace=2            " Make the backspace behave as most applications.
set cursorline             " Enable cursorline highlight
set autoindent             " Use current indent for new lines.
set wildmenu               " Better tab completion in the commandline.
set wildmode=list:longest  " List all matches and complete to the longest match.
set showcmd                " Show (partial) command in bottom-right.
set smarttab               " Backspace removes 'shiftwidth' worth of spaces.
set number                 " Show line numbers.
set wrap                   " Wrap long lines.
set laststatus=2           " Always show the statusline.
set ruler                  " Show the ruler in the statusline.
set incsearch              " Jump to search match while typing.
set ignorecase             " Searching with / is case-insensitive.
set smartcase              " Disable 'ignorecase' if the term contains upper-case.
set tabstop=4              " Size of a Tab character.
set shiftwidth=0           " Use same value as 'tabstop'.
set softtabstop=-1         " Use same value as 'shiftwidth'.
