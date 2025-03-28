#!/bin/bash
set -x
echo "Setting up environment"


# set proxy temporarily
export https_proxy=http://192.168.20.3:7890
export http_proxy=http://192.168.20.3:7890
export all_proxy=http://192.168.20.3:7890

# install oh-my-zsh & powerlevel10k theme
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

unset https_proxy
unset http_proxy
unset all_proxy



tee -a ~/.zshrc <<EOF
export proxy_client="192.168.20.3"
export proxy_port="7890"
function proxy() {
    ip=${proxy_client}
    port=${proxy_port}
    if [ "$1" = "on" ]; then
        export https_proxy=http://$proxy_client:$proxy_port
        export http_proxy=http://$proxy_client:$proxy_port
        export all_proxy=http://$proxy_client:$proxy_port
        echo proxy on
    else
        unset https_proxy
        unset http_proxy
        unset all_proxy
        echo proxy off
    fi
}
EOF

echo "Setup complete"
