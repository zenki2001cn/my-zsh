#!/bin/bash

OHMYZSH_DIR=`pwd`

function backup_zshrc()
{
    echo "backup .zshrc"
    zshrc_org="~/.zshrc"
    if [[ -L ~/.zshrc ]]; then
        echo "delete link $zshrc_org"
        rm -f $zshrc_org
    elif [[ -f ~/.zshrc ]]; then
        echo "backup .zshrc to ~/zshrc_backup"
        mv ~/.zshrc ~/zshrc_backup
    fi
}

function install_zsh()
{
    echo "install oh-my-zsh..."
    rm -f ~/.zshrc

    cp -r $OHMYZSH_DIR ~/.oh-my-zsh
    ln -s  $OHMYZSH_DIR/templates/zshrc.zsh-zenki ~/.zshrc
    # ln -s $OHMYZSH_DIR ~/.oh-my-zsh
    chsh -s /bin/zsh
    echo "oh-my-zsh real path is --> $OHMYZSH_DIR"
}

backup_zshrc
install_zsh
