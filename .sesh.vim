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
badd +70 extension.js
badd +16 schemas/schema.gschema.xml
badd +24 term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//32023:bash
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
exe 'vert 1resize ' . ((&columns * 78 + 106) / 213)
exe '2resize ' . ((&lines * 45 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 134 + 106) / 213)
exe '3resize ' . ((&lines * 11 + 30) / 60)
exe 'vert 3resize ' . ((&columns * 134 + 106) / 213)
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 75 - ((39 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 75
normal! 05|
wincmd w
argglobal
if bufexists(fnamemodify("schemas/schema.gschema.xml", ":p")) | buffer schemas/schema.gschema.xml | else | edit schemas/schema.gschema.xml | endif
if &buftype ==# 'terminal'
  silent file schemas/schema.gschema.xml
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
let s:l = 18 - ((0 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 18
normal! 024|
wincmd w
argglobal
if bufexists(fnamemodify("term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//32023:bash", ":p")) | buffer term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//32023:bash | else | edit term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//32023:bash | endif
if &buftype ==# 'terminal'
  silent file term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//32023:bash
endif
balt schemas/schema.gschema.xml
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 11 - ((10 * winheight(0) + 5) / 11)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 78 + 106) / 213)
exe '2resize ' . ((&lines * 45 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 134 + 106) / 213)
exe '3resize ' . ((&lines * 11 + 30) / 60)
exe 'vert 3resize ' . ((&columns * 134 + 106) / 213)
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
let g:CJWinBuffs = {'0': ['term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash', 'extension.js'], '1': ['extension.js', 'term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash', '/home/chinmay/.config/nvim/init.vim', 'extension.js'], '2': ['schemas/schema.gschema.xml', '/home/chinmay/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08/schemas', 'extension.js', 'term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash'], '3': ['term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//32023:bash', 'schemas/schema.gschema.xml', 'extension.js', 'term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//21599:bash', 'term://~/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08//30277:bash']}
let g:CJLoadedSeshName = '/home/chinmay/.local/share/gnome-shell/extensions/window.brightness@chinmayjain08'
