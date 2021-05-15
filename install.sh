SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

sudo apt install -y build-essential
sudo apt install -y curl
sudo apt install -y fonts-cascadia-cod
sudo apt install -y fonts-powerline
sudo apt install -y dconf-editor  # for save and restore terminal configurations
sudo apt install -y ranger
sudo apt install -y googler
sudo apt install -y chafa
sudo apt install -y ncdu
sudo apt install -y tldr
sudo apt install -y jq
sudo apt install -y fd-find

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

wget -O /tmp/gitdelta.deb https://github.com/dandavison/delta/releases/download/0.7.1/git-delta_0.7.1_amd64.deb
sudo apt install /tmp/gitdelta.deb

# github.com/sharkdp/bat
sudo apt install -y bat

# github.com/junegunn/fzf
sudo apt install -y fzf

sudo apt install -y tmux


# Gvim / Vim GTK3
sudo apt install -y vim-gtk3
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim.gtk3 1
sudo update-alternatives --set editor /usr/bin/vim.gtk3

# Vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qal
