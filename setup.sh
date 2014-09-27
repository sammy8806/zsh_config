#!/usr/bin/env sh

ZSH_INSTALLED="no"

if [ -s /etc/shells ]; then
        TMP="`grep 'zsh' /etc/shells`"
        if [ ! -z "$TMP" ]; then
                ZSH_INSTALLED="yes"
        fi
fi

if [ "$ZSH_INSTALLED" == "no" ]; then
        echo "Please install ZSH on your system ..."
        exit 1
else
        ZSH_PATH=`grep zsh /etc/shells | egrep -v 'rzsh'`
fi

echo "Installing Symlinks ..."

ln -s `pwd`/.zshrc ~/.zshrc
ln -s `pwd`/.zsh-update ~/.zsh-update
ln -s `pwd`/.oh-my-zsh ~/.oh-my-zsh

echo "Symlinks installed!"

echo "Changing your Login-Shell"
chsh -s "$ZSH_PATH"
