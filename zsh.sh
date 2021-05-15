sudo apt install -y zsh

# oh my zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy custom theme
cp -f configs/diego-ubuntu.zsh-theme ~/.oh-my-zsh/themes/diego-ubuntu.zsh-theme

THEME=diego-ubuntu
PLUGINS="git asdf autopep8 django dotenv docker docker-compose golang history pep8 python tmux ubuntu"

sed -i -r "s/^(ZSH_THEME=\")(\w*)/\1$THEME/" ~/.zshrc
sed -i -r "s/^(plugins=\()(\w*)/\1$PLUGINS/" ~/.zshrc
