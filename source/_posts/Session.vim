let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/blog/source/_posts
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 python-wsgi-e6-95-99-e7-a8-8b-e5-9b-9b-e5-8f-af-e8-bf-ad-e4-bb-a3-e5-93-8d-e5-ba-94-e5-af-b9-e8-b1-a1.md
argglobal
silent! argdel *
argadd python-wsgi-e6-95-99-e7-a8-8b-e5-9b-9b-e5-8f-af-e8-bf-ad-e4-bb-a3-e5-93-8d-e5-ba-94-e5-af-b9-e8-b1-a1.md
edit python-wsgi-e6-95-99-e7-a8-8b-e5-9b-9b-e5-8f-af-e8-bf-ad-e4-bb-a3-e5-93-8d-e5-ba-94-e5-af-b9-e8-b1-a1.md
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 63 - ((8 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
63
normal! 08|
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
