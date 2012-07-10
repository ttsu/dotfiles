#!/bin/bash
# homemake.sh v0.1
# Furnishes the home directory with dotfiles

DOTFILES_DIR=.
BACKUP_DIR=~/.dotfiles.old
FILES="vimrc vim zshrc oh-my-zsh"

# Create backup dir
if [ ! -d $BACKUP_DIR ]; then
	echo "Creating $BACKUP_DIR for dotfile backup"
	mkdir -p $BACKUP_DIR
fi

for FILE in $FILES; do
	if [ -e $DOTFILES_DIR/$FILE ]; then

		if [ -e ~/.$FILE && ! -h ~/.$FILE ]; then
			echo "Found existing .$FILE. Moving to $BACKUP_DIR" 
			mv -i ~/.$FILE $BACKUP_DIR/
		fi

		echo "linking .$FILE"
		ln -s $DOTFILES_DIR/$FILE ~/.$FILE
	fi
done

echo "Furnished!"