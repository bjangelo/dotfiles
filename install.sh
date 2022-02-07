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
link dircolors/dir_colors ~/.dir_colors
link fonts/Hack_Nerd_Font ~/.local/share/fonts/Hack_Nerd_Font
link fonts/OperatorMono_Nerd_Font ~/.local/share/fonts/OperatorMono_Nerd_Font
link git/gitconfig ~/.gitconfig
link git/git-prompt.sh ~/.git-prompt.sh
link i3/config ~/.config/i3/config
link i3status/config ~/.config/i3status/config
link icons/capitaine-cursors-light ~/.icons/capitaine-cursors-light
link icons/capitaine-cursors-light ~/.local/share/icons/capitaine-cursors-light
link icons/NordArc ~/.icons/NordArc
link icons/NordArc ~/.local/share/icons/NordArc
link picom/picom.conf ~/.config/picom/picom.conf
link ssh/rc ~/.ssh/rc
link themes/NordArc ~/.local/share/themes/NordArc
link tmux/nord.conf ~/.tmux/nord.conf
link tmux/nord-status-content.conf ~/.tmux/nord-status-content.conf
link tmux/tmux.conf ~/.tmux.conf
link vim/vimrc ~/.vimrc
link vim/colors/nord.vim ~/.vim/colors/nord.vim
link vim/colors/wombat256.vim ~/.vim/colors/wombat256.vim
link vim/plugin/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim
link wallpapers/fehbg ~/.fehbg
link wallpapers/tower-nord.png ~/.config/wallpapers/tower-nord.png
link x11/xinitrc ~/.xinitrc
link x11/Xresources ~/.Xresources

fc-cache -f
