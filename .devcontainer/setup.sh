#!/bin/bash
set -x
echo "Setting up environment"


# set proxy temporarily
export https_proxy=http://192.168.20.3:7890
export http_proxy=http://192.168.20.3:7890
export all_proxy=http://192.168.20.3:7890

# install oh-my-zsh & powerlevel10k theme
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
cd $HOME && curl -fsSLO https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower

unset https_proxy
unset http_proxy
unset all_proxy


cp /tmp/.zshrc ~/.zshrc

echo "Setup complete"
