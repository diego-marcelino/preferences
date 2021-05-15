# Gnome terminal
~/preferences/helpers/gnome-terminal-profile.sh import ~/preferences/configs/terminal.profile

# VIM
cp -f ~/preferences/configs/.vimrc ~/.vimrc

# Tmux
tmux set-option status-style fg=white,bg=black

# Git
cp -f ~/preferences/configs/.gitconfig ~/.gitconfig
