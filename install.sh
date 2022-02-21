#!/bin/bash -x

die() {
	echo "ERROR: $*" >&2
	exit 1
}

link() {
	SOURCE=$1
	TARGET=$2

	if [ -e "$TARGET" ]; then
		if [ -L "$TARGET" ]; then
			rm "$TARGET"
		elif [ -f "$TARGET" ]; then
			mv "$TARGET" "$TARGET.bak"
		else
			die "$TARGET already exists"
		fi
	fi

	mkdir -p "$(dirname "$TARGET")" || die "Failed to create $(dirname "$TARGET")"

	ln -sf "$DIR"/"$SOURCE" "$TARGET"
}

DIR=$(realpath "$(dirname "$0")") || die "Failed to get script directory"

link alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml 
link bash/bash_aliases ~/.bash_aliases
link bash/bash_profile ~/.bash_profile
link bash/bashrc ~/.bashrc
link bash/make-c-refs ~/.local/bin/make-c-refs
link bash/make-go-refs ~/.local/bin/make-go-refs
link dircolors/dir_colors ~/.dir_colors
link fonts/Hack_Nerd_Font ~/.local/share/fonts/Hack_Nerd_Font
link fonts/OperatorMono_Nerd_Font ~/.local/share/fonts/OperatorMono_Nerd_Font
link git/gitconfig ~/.gitconfig
link git/git-prompt.sh ~/.git-prompt.sh
link i3/config ~/.config/i3/config
link i3status/config ~/.config/i3status/config
link icons/capitaine-cursors-light ~/.icons/capitaine-cursors-light
link icons/capitaine-cursors-light ~/.local/share/icons/capitaine-cursors-light
link picom/picom.conf ~/.config/picom/picom.conf
link ssh/rc ~/.ssh/rc
link tmux/wombat.conf ~/.tmux/wombat.conf
link tmux/tmux.conf ~/.tmux.conf
link vim/vimrc ~/.vimrc
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
link vim/colors/wombat256.vim ~/.vim/colors/wombat256.vim
link vim/pack/tpope ~/.vim/pack/tpope
link vim/plugin/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim
link wallpapers/fehbg ~/.fehbg
link wallpapers/lock ~/.i3lock
link wallpapers/nature.png ~/.config/wallpapers/nature.png
link x11/xinitrc ~/.xinitrc
link x11/Xresources ~/.Xresources

fc-cache -f
