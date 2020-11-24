#!/bin/bash
ln -s $(PWD)/.gitignore_global ~/.gitignore_global
ln -s $(PWD)/.tmux.conf ~/.tmux.conf
ln -s $(PWD)/.ctags ~/.ctags
mkdir -p ~/.config/nvim
ln -s $(PWD)/.vimrc ~/.config/nvim/init.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

