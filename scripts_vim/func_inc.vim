" This file will source all the functions written for vim found in the
" function_files/ directory. This file can be sourced and maintained so
" it is all compiled and called by ~/.vimrc in one place.

" TODO: Once we include more than one function file, see if using * works with
"		the source call so it can just be a one liner instead of many lines of
"		sourcing files. ^_^;


"let resultsyo = expand("<sfile>")

" NOTE: This resolved to ~/.vim/vimrc_files/func_inc.vim (symlink) at first.

let ex_script     = expand("<script>")
let res_ex_script = resolve(ex_script)

let ex_p     = expand("<script>:p")
let res_ex_p = resolve(ex_p)

let ex_h     = expand("<script>:h")
let res_ex_h = resolve(ex_h)

let ex_ph     = expand("<script>:p:h")
let res_ex_ph = resolve(ex_ph)

let gl_rep  = glob('~/git_repos/vim_files/scripts_vim/*.vim')
let gl_home = glob('~/.vim/vimrc_files/*.vim')


" let final_split = split(glob(resolve(expand("<script>")) .. "/function_files/"), "\n")
" let final_split = split(glob(resolve("~/.vim/vimrc_files/func_inc.vim/")), "\n")
" let final_split = split(glob(resolve("~/.vim/vimrc_files/func_inc.vim/")), "\n")

echo "--- printouts of stuff resolving and expanding and things ---\n"
	\ "ex(script)          -> "  ex_script     "\n"
	\ "res(ex(script))     -> "  res_ex_script "\n\n"
	\ "ex(script:p)        -> "  ex_p          "\n"
	\ "res(ex(script:p))   -> "  res_ex_p      "\n\n"
	\ "ex(script:h)        -> "  ex_h          "\n"
	\ "res(ex(script:h))   -> "  res_ex_h      "\n\n"
	\ "ex(script:p:h)      -> "  ex_ph         "\n"
	\ "res(ex(script:p:h)) -> "  res_ex_ph     "\n\n"
	\ "gl_rep              -> "  gl_rep        "\n"
	\ "gl_home             -> "  gl_home       "\n"
