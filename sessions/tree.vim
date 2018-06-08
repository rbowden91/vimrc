" ~/.vim/sessions/tree.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 01 June 2018 at 17:29:03.
" Open this file in Vim and run :source % to restore your session.

if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'smyck' | colorscheme smyck | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /mnt/c/microsoft
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +104 tree/preprocess.py
badd +26 tree/dump_ast.py
badd +136 tree/tensorarray.py
badd +121 tree/server.py
badd +363 tree/model.py
badd +31 tree/train.py
badd +1 web/server.js
badd +188 old/linear/server.py
badd +105 tree/normalize.py
badd +1 tree/renamer.py
badd +129 tree/linearize_ast.py
badd +63 web/public/heatmap.js
badd +0 tree/config.py
argglobal
silent! argdel *
$argadd tree/server.py
$argadd tree/model.py
$argadd tree/train.py
$argadd tree/tensorarray.py
set stal=2
edit tree/tensorarray.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
edit tree/tensorarray.py
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999999
setlocal fml=1
setlocal fdn=20
setlocal fen
7
silent! normal! zo
9
silent! normal! zo
18
silent! normal! zo
26
silent! normal! zo
37
silent! normal! zo
77
silent! normal! zo
78
silent! normal! zo
81
silent! normal! zo
89
silent! normal! zo
124
silent! normal! zo
126
silent! normal! zo
139
silent! normal! zo
177
silent! normal! zo
186
silent! normal! zo
195
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
202
silent! normal! zo
210
silent! normal! zo
210
silent! normal! zo
210
silent! normal! zo
210
silent! normal! zo
210
silent! normal! zo
210
silent! normal! zo
210
silent! normal! zo
210
silent! normal! zo
219
silent! normal! zo
221
silent! normal! zo
230
silent! normal! zo
let s:l = 20 - ((19 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 0
tabedit tree/linearize_ast.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
edit tree/linearize_ast.py
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999999
setlocal fml=1
setlocal fdn=20
setlocal fen
7
silent! normal! zo
8
silent! normal! zo
12
silent! normal! zo
47
silent! normal! zo
76
silent! normal! zo
79
silent! normal! zo
128
silent! normal! zo
let s:l = 103 - ((50 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
103
normal! 029|
tabedit tree/model.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
edit tree/model.py
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999999
setlocal fml=1
setlocal fdn=20
setlocal fen
273
silent! normal! zo
372
silent! normal! zo
373
silent! normal! zo
375
silent! normal! zo
379
silent! normal! zo
385
silent! normal! zo
411
silent! normal! zo
413
silent! normal! zo
416
silent! normal! zo
424
silent! normal! zo
434
silent! normal! zo
let s:l = 424 - ((43 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
424
normal! 021|
tabedit tree/config.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
edit tree/config.py
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999999
setlocal fml=1
setlocal fdn=20
setlocal fen
17
silent! normal! zo
let s:l = 26 - ((25 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
26
normal! 0104|
tabedit tree/server.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999999
setlocal fml=1
setlocal fdn=20
setlocal fen
28
silent! normal! zo
28
silent! normal! zo
28
silent! normal! zo
28
silent! normal! zo
38
silent! normal! zo
49
silent! normal! zo
50
silent! normal! zo
56
silent! normal! zo
57
silent! normal! zo
72
silent! normal! zo
94
silent! normal! zo
100
silent! normal! zo
106
silent! normal! zo
114
silent! normal! zo
127
silent! normal! zo
128
silent! normal! zo
131
silent! normal! zo
142
silent! normal! zo
156
silent! normal! zo
173
silent! normal! zo
190
silent! normal! zo
192
silent! normal! zo
194
silent! normal! zo
199
silent! normal! zo
204
silent! normal! zo
214
silent! normal! zo
215
silent! normal! zo
217
silent! normal! zo
219
silent! normal! zo
220
silent! normal! zo
222
silent! normal! zo
222
silent! normal! zo
222
silent! normal! zo
235
silent! normal! zo
241
silent! normal! zo
243
silent! normal! zo
245
silent! normal! zo
258
silent! normal! zo
270
silent! normal! zo
281
silent! normal! zo
284
silent! normal! zo
287
silent! normal! zo
289
silent! normal! zo
290
silent! normal! zo
290
silent! normal! zo
297
silent! normal! zo
304
silent! normal! zo
305
silent! normal! zo
306
silent! normal! zo
313
silent! normal! zo
321
silent! normal! zo
342
silent! normal! zo
354
silent! normal! zo
358
silent! normal! zo
363
silent! normal! zo
389
silent! normal! zo
392
silent! normal! zo
398
silent! normal! zo
400
silent! normal! zo
404
silent! normal! zo
410
silent! normal! zo
422
silent! normal! zo
431
silent! normal! zo
let s:l = 295 - ((41 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
295
normal! 021|
tabedit tree/preprocess.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
edit tree/preprocess.py
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999999
setlocal fml=1
setlocal fdn=20
setlocal fen
22
silent! normal! zo
46
silent! normal! zo
93
silent! normal! zo
113
silent! normal! zo
115
silent! normal! zo
127
silent! normal! zo
129
silent! normal! zo
130
silent! normal! zo
131
silent! normal! zo
132
silent! normal! zo
139
silent! normal! zo
148
silent! normal! zo
155
silent! normal! zo
156
silent! normal! zo
157
silent! normal! zo
165
silent! normal! zo
167
silent! normal! zo
168
silent! normal! zo
176
silent! normal! zo
180
silent! normal! zo
182
silent! normal! zo
194
silent! normal! zo
201
silent! normal! zo
204
silent! normal! zo
205
silent! normal! zo
206
silent! normal! zo
215
silent! normal! zo
218
silent! normal! zo
234
silent! normal! zo
305
silent! normal! zo
306
silent! normal! zo
308
silent! normal! zo
309
silent! normal! zo
309
silent! normal! zo
309
silent! normal! zo
let s:l = 215 - ((59 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
215
normal! 0
tabedit tree/train.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
edit tree/train.py
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999999
setlocal fml=1
setlocal fdn=20
setlocal fen
106
silent! normal! zo
107
silent! normal! zo
109
silent! normal! zo
109
silent! normal! zo
109
silent! normal! zo
120
silent! normal! zo
133
silent! normal! zo
152
silent! normal! zo
161
silent! normal! zo
165
silent! normal! zo
167
silent! normal! zo
171
silent! normal! zo
178
silent! normal! zo
181
silent! normal! zo
181
silent! normal! zo
181
silent! normal! zo
183
silent! normal! zo
183
silent! normal! zo
183
silent! normal! zo
195
silent! normal! zo
196
silent! normal! zo
199
silent! normal! zo
203
silent! normal! zo
207
silent! normal! zo
211
silent! normal! zo
215
silent! normal! zo
219
silent! normal! zo
221
silent! normal! zo
230
silent! normal! zo
242
silent! normal! zo
249
silent! normal! zo
271
silent! normal! zo
277
silent! normal! zo
297
silent! normal! zo
306
silent! normal! zo
323
silent! normal! zo
let s:l = 37 - ((31 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
37
normal! 030|
tabedit tree/normalize.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
edit tree/normalize.py
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999999
setlocal fml=1
setlocal fdn=20
setlocal fen
16
silent! normal! zo
20
silent! normal! zo
24
silent! normal! zo
30
silent! normal! zo
41
silent! normal! zo
46
silent! normal! zo
48
silent! normal! zo
53
silent! normal! zo
58
silent! normal! zo
78
silent! normal! zo
86
silent! normal! zo
142
silent! normal! zo
182
silent! normal! zo
213
silent! normal! zo
218
silent! normal! zo
240
silent! normal! zo
253
silent! normal! zo
254
silent! normal! zo
260
silent! normal! zo
261
silent! normal! zo
282
silent! normal! zo
284
silent! normal! zo
442
silent! normal! zo
448
silent! normal! zo
let s:l = 334 - ((32 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
334
normal! 020|
tabnext 3
set stal=1
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 3
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
