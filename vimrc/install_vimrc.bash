#!/usr/bin/env bash

# /* 
#  * Use PWD to start with and that will likely be default unless path is provided
#  *
#  * maybe have arguments to alter where the .vimrc goes but have the rest of the
#  * files in .vim. Look up the locations for global/local+root vimrc and just take into
#  * acount handling them.
#  */

#  /* if .vimrc exists, store it somewhere in case they want to revert
#   *    - have a functionality to revert?? If reasonable.
#   */

FILES_DIR_NAME="sedih_vrc"
INST_DIR_NAME="vim_files"


# /* Probably a better way, load in from a file or something. */
INSTALL_FILE_NAMES=( 
	".makefile_vimrc.vim"
	".dflt_set_cmds_vimrc.vim"
	".syn_hi_vimrc.vim"
        ".txt_vimrc.vim"
        ".c_vimrc.vim"
        ".py_vimrc.vim"
	"func_inc.vim"
	"packadd_includes.vim" 
)

for $file in 

VIM_FILE_PATHS=(
	"$HOME/.vim/$INST_DIR_NAME/$FILES_DIR_NAME/${INSTALL_FILE_NAMES[@]}/"
)

echo -e "${VIM_FILE_PATHS[@]}"
exit


had_vim_folder=1  #/* They prolly do */



# NOTE: This came up        using git for windows, .vim is typically there in linux
if [[ -e !"$HOME/.vim/" ]]; then
	echo "There is no ~/.vim folder, creating it for vimrc installation."
	mkdir -v "$HOME/.vim/"
	had_vim_folder=0
fi

# Check if home dir .vimrc exists
# If the .vimrc is in place. the installer was likely ran to place it and its
# related files, handle the case where it was not done by the installer aswell.
if [[ -e "$HOME/.vimrc" ]]; then
	echo "~/.vimrc already exists, removing for reinstall"

	# get user input to confirm what to do about overwriting/storing BU etc.
	# Perhaps have a choice to add specific functions from func_inc using
	# flags or some shit
	# till then:
	rm  -rv --one-file-system ~/.vimrc 


fi

# /* 
#  * NOTE: We could keep the vimrc_files folder instead of destroying anyone also using
#  * 	   the folder
#  * 		We could also just rm -rv the folder.
#  *
#  * Keep it simple i suppose? 
#  */
if [[ -e "$HOME/.vim/$INST_DIR_NAME/" ]]; then
	rm -rv --one-file-system "$VIM_FILE_PATHS" 
fi


# Make the paths
# TODO: Give option for custom path, this non-plugin default path or just the
# plugin files. Theres issues with them all
#if [[ -e "$HOME/vimrc_files" ]]; then
#	
#
#fi

# TODO: Look into realpath's options and see how to make this more robust using 
# them if possible

# TODO: this assumes the files being linked right now are in the pwd
# of the script being ran. make it better ^_^
ln -s "$(realpath ./.vimrc)" ~/.vimrc

# Place the vim files in a place, if the place doesnt exist make it. 
# For now i made it exist

# Figure out a better way to do this - or see what other options are - 
# not having to hardcode it so much using a for or something - or some way to 
# do it all in less ln calls.
ln -s "$(realpath ./.txt_vimrc.vim)" \
	~/.vim/vimrc_files/.txt_vimrc.vim
ln -s "$(realpath ./.c_vimrc.vim)" \
	~/.vim/vimrc_files/.c_vimrc.vim
ln -s "$(realpath ./.py_vimrc.vim)" \
	~/.vim/vimrc_files/.py_vimrc.vim
ln -s "$(realpath ./.makefile_vimrc.vim)" \
	~/.vim/vimrc_files/.makefile_vimrc.vim
ln -s "$(realpath ./.dflt_set_cmds_vimrc.vim)" \
	~/.vim/vimrc_files/.dflt_set_cmds_vimrc.vim
ln -s "$(realpath ./.syn_hi_vimrc.vim)" \
	~/.vim/vimrc_files/.syn_hi_vimrc.vim
ln -s "$(realpath ../scripts_vim/func_inc.vim)" \
	~/.vim/vimrc_files/func_inc.vim
ln -s "$(realpath ../scripts_vim/function_files/)" \
	~/.vim/vimrc_files/scripts/
ln -s "$(realpath ../scripts_vim/function_files/)" \
	~/.vim/vimrc_files/scripts/
