#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Update the repository
if is-executable git -a -d "$DOTFILES_DIR/.git"; then
	git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master;
fi

# Install vim
if ! is-executable vim; then
	sudo apt install vim;
fi

# Install Vundle
if [ ! -d "$HOME/.vim" ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim";
fi

# Install zsh
sudo apt install zsh
zsh --version
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
-O -)"

# Install i3
sudo apt install i3

# Use custom terminal theme (http://mayccoll.github.io/Gogh/#0)
wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh

# Download IBM Plex themes
git clone https://github.com/IBM/plex.git
if [ ! -d "$HOME/.fonts" ]; then
    mkdir $HOME/.fonts;
fi
cp "plex/IBM-Plex-*/fonts/complete/otf/*" "$HOME/.fonts" && rm -rf plex

# Backup config files if present
declare -a config_files=()

shopt -s dotglob
for file in "$DOTFILES_DIR/config"/*
do
	config_files+=($file)
done
shopt -u dotglob

if [ ! -d "$HOME/.dotfile_bak" ]; then
	mkdir $HOME/.dotfile_bak;
fi

for config_file in "${config_files[@]}"
do
	IFS='/' read -r -a paths <<< $config_file
	name="${paths[-1]}"
	if [ -f "$HOME/$name" ]; then
		cp $HOME/$name .dotfile_bak;
	fi

	ln -sfv $config_file $HOME/$name
done

echo "Installation finished. Please open vim and run :PluginInstall"
