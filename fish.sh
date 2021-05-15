sudo apt install -y fish
curl -L https://get.oh-my.fish | fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
set -g theme_title_use_abbreviated_path no
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
fisher install edc/bass
fisher install rafaelrinaldi/pure
fisher install franciscolourenco/done
fisher install jethrokuan/fzf
