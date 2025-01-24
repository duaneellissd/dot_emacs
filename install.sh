#! /bin/bash

HERE=`pwd`

O_DOT_EMACS=${HOME}/.emacs
I_DOT_EMACS=${HERE}/dot_emacs_file


function setup_dot_emacs_file()
{

    if [ -e ${O_DOT_EMACS} ] 
    then
	echo "dot emacs exists..."
	exit 1
    fi
    

    # Must be a HARD LINK, not a soft link
    ln ${I_DOT_EMACS} ${O_DOT_EMACS}
}


O_DOT_EMACS_DIR=${HOME}/.emacs.d
I_DOT_EMACS_DIR=${HERE}/dot_emacs.d

function setup_dot_emacs_dir()
{
    for x in e f d
    do
	if [ -$x ${O_DOT_EMACS_DIR} ]
	then
	    echo "O_DOT_EMACS_DIR exists"
	    exit 1
	fi
    done

    # Directories must be symbolic links
    ln -s ${I_DOT_EMACS_DIR} ${O_DOT_EMACS_DIR}
}


setup_dot_emacs_file
setup_dot_emacs_dir

