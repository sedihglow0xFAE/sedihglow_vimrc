#!/usr/bin/env bash

# Use PWD to start with and that will likely be default unless path is provided

# maybe have arguments to alter where the .vimrc goes but have the rest of the
# files in .vim. Look up the locations for global/local+root vimrc and just take into
# acount handling them.

# if .vimrc exists, store it somewhere in case they want to revert
#	- have a functionality to revert?? If reasonable.

# NOTE: This came up using git for windows, .vim is typically there in linux
if [[ -e !"$HOME/.vim" ]]; then
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
	rm -f ~/.vimrc \



	      ~/.vim/vimrc_files/.makefile_vimrc.vim \
	      ~/.vim/vimrc_files/.dflt_set_cmds_vimrc.vim \
	      ~/.vim/vimrc_files/.syn_hi_vimrc.vim \
	      ~/.vim/vimrc_files/.txt_vimrc.vim \
	      ~/.vim/vimrc_files/.c_vimrc.vim \
	      ~/.vim/vimrc_files/.py_vimrc.vim \
		  ~/.vim/vimrc_files/func_inc.vim \
		  ~/.vim/vimrc_files/packadd_includes.vim
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
