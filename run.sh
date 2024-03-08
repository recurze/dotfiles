#!/bin/sh

pushd ~/dotfiles

mkdir -p bak

create_symlink(){
    mv ~/$1 bak
    ln -s ~/dotfiles/$1 ~/$1
}

for file in `git ls-files '.bash*'`; do
    create_symlink $file
done

for file in .inputrc .tmux.conf .gitconfig; do
    create_symlink $file
done

for folder in .config/*; do
    create_symlink $folder
done

popd
