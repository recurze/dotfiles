#!/bin/bash
setxkbmap -option caps:swapescape

c(){
    cd "$1";
    ls;
};

npg(){
    pdfinfo "$1" | grep Pages | grep -o -E '[0-9]+';
};

play(){
    vlc "$1" 2>/dev/null &
};

df(){
    zathura --mode fullscreen "$1" 2>/dev/null &
};

bak(){
    cp -r "$1" "${1}.bak";
};

restore(){
    mv ${1}.bak ${1};
};

val(){
    echo $(($@))
    #python2 -c "print eval(str($@))"
};

stripdf(){
    pdftk "$1" cat "$2"-"$3" output "$4".pdf;
    echo pdftk "$1" cat "$2"-"$3" output "$4".pdf;
}

ansi()          { echo -e "\e[${1}m${2}\e[0m"; };
bold()          { ansi 1 "$1"; };
italic()        { ansi 3 "$1"; };
underline()     { ansi 4 "$1"; };
strikethrough() { ansi 9 "$1"; };

alias ..="c .."
alias ...="c ../.."
alias ....="c ../../.."

#alias ct="date +%T"
alias p="pwd"
alias size="du -sbh"
alias vi="vim"
alias ff="firefox 2>/dev/null &"
alias restartgui="nohup cinnamon --replace > /dev/null 2>&1"
alias op="xdg-open"
alias c2pdf="libreoffice --headless --invisible --convert-to pdf"

alias dl="aria2c --file-allocation=none -c -x 10 -s 10 -d ."

set -o vi
bind "TAB:menu-complete"

#PS_TIME="\033[01;31m\]\t\033[0m"
PS_TIME="\t"
#PS1=$PS_TIME"|\033[01;32m\]\$(~/scripts/batstatus.sh)%\033[0m| \033[01;33m\]\W\033[0m>"
PS1=$PS_TIME"|\$(~/scripts/batstatus.sh)%| \W>"
