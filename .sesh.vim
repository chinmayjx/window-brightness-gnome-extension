let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +49 extension.js
badd +1 term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash
argglobal
%argdel
edit extension.js
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 106 + 106) / 213)
exe '2resize ' . ((&lines * 41 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 213)
exe '3resize ' . ((&lines * 15 + 30) / 60)
exe 'vert 3resize ' . ((&columns * 106 + 106) / 213)
argglobal
balt term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 49 - ((28 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 49
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("extension.js", ":p")) | buffer extension.js | else | edit extension.js | endif
if &buftype ==# 'terminal'
  silent file extension.js
endif
balt term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash", ":p")) | buffer term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash | else | edit term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash | endif
if &buftype ==# 'terminal'
  silent file term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash
endif
balt extension.js
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 37 - ((14 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 37
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 106) / 213)
exe '2resize ' . ((&lines * 41 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 106 + 106) / 213)
exe '3resize ' . ((&lines * 15 + 30) / 60)
exe 'vert 3resize ' . ((&columns * 106 + 106) / 213)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
let g:CJWinBuffs = {'0': ['term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//22507:node extension.js', 'extension.js'], '1': ['extension.js', 'term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash', '/home/chinmay/.config/nvim/init.vim', 'extension.js'], '2': ['extension.js'], '3': ['term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash', 'extension.js']}
let g:CJLoadedSeshName = '/home/chinmay/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08'
