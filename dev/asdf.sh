# -----------------------------------------------
# Docker
# -----------------------------------------------
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
# docs.docker.com/engine/install/linux-postinstall/
sudo systemctl disable docker.service
sudo systemctl disable containerd.service
# start: sudo systemctl start docker
# start: sudo systemctl stop docker
mkdir -p /usr/local/bin/
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.28.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose


#######################################################################################################################
# LANGUAGES
#######################################################################################################################

# -----------------------------------------------
# install ASDF
# ASDF plugins: github.com/asdf-vm/asdf-plugins
# -----------------------------------------------
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

TO_RC_FILE="
# -----------------------------------------------
# ASDF
# -----------------------------------------------
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
"
@echo $TO_RC_FILE >> ~/.bashrc
source ~/.zshrc
asdf update

# -----------------------------------------------
# Python / virtualenv
# -----------------------------------------------
sudo apt install -y python3-pip
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

pip install -y virtualenvwrapper

VENVSDIR=~/.virtualenvs
mkdir -p $VENVSDIR

TO_RC_FILE="
# -----------------------------------------------
# PYTHON VIRTUALENVWRAPPER
# -----------------------------------------------
export WORKON_HOME=$VENVSDIR
source ~/.local/bin/virtualenvwrapper.sh
"
@echo $TO_RC_FILE >> ~/.bashrc


# -----------------------------------------------
# Erlang (needed for Elixir)
# -----------------------------------------------
ERLANG_VERSION=23.2.3
sudo apt install -y libssl-dev automake autoconf libncurses5-dev
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang $ERLANG_VERSION
asdf global erlang $ERLANG_VERSION


# -----------------------------------------------
# Elixir
# -----------------------------------------------
ELIXIR_VERSION=1.11.3
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir $ELIXIR_VERSION
asdf global elixir $ELIXIR_VERSION


# -----------------------------------------------
# Golang
# -----------------------------------------------
GOLANG_VERSION=1.15.7
sudo apt install -y coreutils curl
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf install golang $GOLANG_VERSION
asdf global golang $GOLANG_VERSION
TO_RC_FILE="
# -----------------------------------------------
# GOLANG
# -----------------------------------------------
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
"
@echo $TO_RC_FILE >> ~/.bashrc


# -----------------------------------------------
# Node
# -----------------------------------------------
NODE_VERSION=lts
sudo apt install -y dirmngr gpg curl gawk
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs $NODE_VERSION
asdf global nodejs $NODE_VERSION


# -----------------------------------------------
# JAVA
# -----------------------------------------------
JAVA8_VERSION=adoptopenjdk-8.0.282+8
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java $JAVA8_VERSION
asdf global java $JAVA8_VERSION


# -----------------------------------------------
# PHP
# -----------------------------------------------
sudo apt install -y autoconf bison build-essential curl gettext git libgd-dev libcurl4-openssl-dev libedit-dev \
                    libicu-dev libjpeg-dev libmysqlclient-dev libonig-dev libpng-dev libpq-dev libreadline-dev \
                    libsqlite3-dev libssl-dev libxml2-dev libzip-dev openssl pkg-config re2c zlib1g-dev
PHP_VERSION=7.4.15
asdf plugin-add php https://github.com/asdf-community/asdf-php.git
asdf install php $PHP_VERSION
asdf global php $PHP_VERSION
composer global require friendsofphp/php-cs-fixer
asdf reshim
