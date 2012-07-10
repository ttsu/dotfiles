#!/bin/bash
# homemake.sh v0.1
# Furnishes the home directory with dotfiles

DOTFILES_DIR=.
BACKUP_DIR=~/.dotfiles.old
FILES="vimrc zshrc"

# Create backup dir
if [ ! -d $BACKUP_DIR ]; then
	echo "Creating $BACKUP_DIR for dotfile backup"
	mkdir -p $BACKUP_DIR
fi

for FILE in $FILES; do
	if [ -e $DOTFILES_DIR/$FILE ]; then

		if [ -h ~/.$FILE ]; then
			echo "~/.$FILE is already linked"
			continue
		elif [ -e ~/.$FILE ]; then
			echo "Found existing .$FILE. Moving to $BACKUP_DIR" 
			mv -i ~/.$FILE $BACKUP_DIR/
		else
			echo "linking .$FILE"
			ln -s $DOTFILES_DIR/$FILE ~/.$FILE
		fi
	fi
done

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
	echo "You already have Oh My Zsh installed"
else
	echo "Auto-installing Oh My Zsh..."
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# Install vundle
if [ -d ~/.vim/bundle/vundle ]; then
	echo "You already have vundle installed"
else
	echo "Installing vundle..."
 	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

echo "Furnished!"
