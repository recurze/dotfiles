setxkbmap -option caps:swapescape
xmodmap -e 'keycode 63='

EDITOR=/usr/bin/vim
export EDITOR

c(){
    cd "$1";
    ls;
};

play(){
    vlc "$1" 2>/dev/null &
};

df(){
    zathura --mode fullscreen "$1" 2>/dev/null &
};

bak(){
    cp -r "$1" "${1}.bak"
};

restore(){
    mv ${1}.bak ${1};
};

val(){
    echo $(($@))
}

alias ..="c .."
alias ...="c ../.."
alias ....="c ../../.."

alias l="ls"
alias p="pwd"
alias vi="vim"
alias sz="du -sbh"
alias op="xdg-open"
alias ff="firefox 2>/dev/null &"
alias c2pdf="libreoffice --headless --invisible --convert-to pdf"
alias restartgui="nohup cinnamon --replace > /dev/null 2>&1"

alias dl="aria2c --file-allocation=none -c -x 10 -s 10 -d ."

set -o vi
bind "TAB:menu-complete"

PS_TIME="\t"
PS1=$PS_TIME"|\$(~/scripts/batstatus.sh)%| \W>"
