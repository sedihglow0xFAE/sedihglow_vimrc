" The toggle transparent function 

" TODO: Figure out a way to change the gnome-terminal opaticity either via
"	    vimscript on top or with an os key setting that can be set elsewhere
"		like bash/sh


" TODO: 
" - Check if prev_cterm_bg had values and is filled. maybe a flag? May resolve
" 
"		

let s:hi_group_names = [
						\ "Normal"	  ,
						\ "LineNr"	  ,
						\ "Folded"	  ,
						\ "NonText"	  ,
						\ "SpecialKey",
						\ "VertSplit" ,
						\ "SignColumn",
						\ "FoldColumn"
					 \ ]

let s:prev_cterm_bg = {}

" TODO: Function to add/remove a group name to the trans_hi_groups

" for transparent background
function! Transparent_switch()
	"go through highlight groups
	for hi_group in s:hi_group_names
		let hi_group_id = hlID(hi_group)
		let s:prev_cterm_bg[hi_group] = synIDattr(synIDtrans(hi_group_id),"bg")

		" If the resulting bg is non-existant a empty string is returned.
		" If an empty string is found, replace it with 'none' to use in an
		" exec command when switching back. Using just empty string causes an
		" error with :hi .... ctermbg=''
		if s:prev_cterm_bg[hi_group] == "" 
			let s:prev_cterm_bg[hi_group] = "none"
		endif

		execute "highlight" hi_group  "ctermbg=none"
	endfor
	" set nocursorline
endfunction
" autocmd ColorScheme * call AdaptColorscheme()

" Switch back to opaque from a previous call to switch_transparent
function! Transparent_back()
	for hi_group in s:hi_group_names
		execute "highlight" hi_group  "ctermbg=" .. s:prev_cterm_bg[hi_group]
	endfor
	" set cursorline
endfunction

" Allows the ability to toggle transparency (no gvim currently)
let s:is_trans = 0
function! Transparent_toggle()
	if s:is_trans == 0
		" Sets term vim to transparent
		call Transparent_switch()
		let s:is_trans = 1
	else
		" Sets term vim to opaque
		call Transparent_back()
		let s:is_trans = 0
	endif
endfunction
" nnoremap <C-t> : call Toggle_transparent()<CR>

function! Transparent_in_testing()
	highlight Normal guibg=NONE ctermbg=NONE
	highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
	highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
	highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
	"highlight clear LineNr
	"highlight clear SignColumn
	highlight clear StatusLine

	" Change Color when entering Insert Mode
	autocmd InsertEnter * set nocursorline

	" Revert Color to default when leaving Insert Mode
	autocmd InsertLeave * set nocursorline

	" extra settings, uncomment them if necessary :) 
	"set cursorline
	"set noshowmode
	"set nocursorline

	" trasparent end
endfunction
