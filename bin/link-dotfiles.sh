#!/bin/sh
DOTFILES_PATH=~/.dotfiles

ln -s $DOTFILES_PATH/bash/bashrc ~/.bashrc
ln -s $DOTFILES_PATH/bin ~/bin
ln -s $DOTFILES_PATH/bash/bashrc-specific ~/.bashrc-specific
ln -s $DOTFILES_PATH/git/gitconfig ~/.gitconfig
ln -s $DOTFILES_PATH/git/gitignore ~/.gitignore
ln -s $DOTFILES_PATH/input/editrc ~/.editrc
ln -s $DOTFILES_PATH/input/haskeline ~/.haskeline
ln -s $DOTFILES_PATH/input/inputrc ~/.inputrc
ln -s $DOTFILES_PATH/input/xmodmaprc ~/.xmodmaprc
ln -s $DOTFILES_PATH/vim ~/.vim
ln -s $DOTFILES_PATH/xmonad ~/.xmonad
ln -s $DOTFILES_PATH/prezto/runcoms/zlogin ~/.zlogin
ln -s $DOTFILES_PATH/prezto/runcoms/zlogout ~/.zlogout
ln -s $DOTFILES_PATH/prezto/runcoms/zpreztorc ~/.zpreztorc
ln -s $DOTFILES_PATH/prezto/runcoms/zprofile ~/.zprofile
ln -s $DOTFILES_PATH/prezto/runcoms/zshenv ~/.zshenv
ln -s $DOTFILES_PATH/prezto/runcoms/zshrc ~/.zshrc
ln -s $DOTFILES_PATH/prezto ~/.zprezto
