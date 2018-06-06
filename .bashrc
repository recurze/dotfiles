#!/bin/bash
setxkbmap -option caps:swapescape

c(){
    cd "$1";
    ls;
};

df(){
    evince -f "$1" &
};

bak(){
    cp -r "$1" "${1}.bak";
};

competein(){
    mkdir ~/summer/comp/contest/${1}
    cd ~/summer/comp/contest/${1}
    mkdir aa bb cc dd ee
    alias aa="..; cd aa"
    alias bb="..; cd bb"
    alias cc="..; cd cc"
    alias dd="..; cd dd"

   source ~/scripts/comp.sh;
};

alias ..="c .."
alias ...="c ../.."
alias ....="c ../../.."

alias ct="date +%T"
alias p="pwd"
alias size="du -sbh"
alias vi="vim"
alias ff="firefox &"
alias bye="poweroff"
alias restartgui="nohup cinnamon --replace > /dev/null 2>&1"
alias bt="bluetoothctl <<< \"connect D0:8A:55:61:08:56\""

alias install="sudo pacman -S"
alias remove="sudo pacman -Runs"
alias upgrade="sudo pacman -Syy"
alias update="sudo pacman -Syu"

alias ml="c ~/summer/ml"
alias ai="c ~/summer/ai"
alias wd="c ~/summer/wd"
alias comp="c ~/summer/comp"
alias thoughts="vim \"+normal Go\" ~/summer/.thoughts"
alias log="vi ~/summer/.log"
alias scenarios="vi ~/summer/.scenarios"

set -o vi
bind "TAB:menu-complete"

PS1="\t] \W>"

alias sl="ls"
alias l="ls"
alias amke="make"