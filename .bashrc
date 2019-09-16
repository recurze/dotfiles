setxkbmap -option caps:swapescape
xmodmap -e 'keycode 63='

EDITOR=/usr/bin/vim
export EDITOR

c(){
    cd "$1";
    ls;
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

batstatus(){
    BAT=/org/freedesktop/UPower/devices/battery_BAT0
    STAT=$(upower -i ${BAT})
    P=$(upower -i ${BAT} | grep percentage | sed 's/[^0-9]*//g')
    echo -e ${P}%
}

colors(){
    for C in {0..255}
    do
        tput setab $C;
        echo -n "$C "
    done
    tput sgr0
    echo
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
alias mus="mpv --no-video"
alias c2pdf="libreoffice --headless --invisible --convert-to pdf"
alias restartgui="nohup cinnamon --replace > /dev/null 2>&1"

alias dl="aria2c --file-allocation=none -c -x 10 -s 10 -d ."

set -o vi
bind "TAB:menu-complete"

RESET="$(tput sgr0)"

RED="$(tput setab 160)"
BLACK="$(tput setab 232)"
LIGHTGREEN="$(tput setab 30)"
PRUSSIAN="$(tput setab 17)"
GREY="$(tput setab 245)"

PS1='${BLACK}\t ${RESET}${PRUSSIAN} $(batstatus) ${RESET}${LIGHTGREEN}\! ${RESET}${RED}\w${RESET}\n${GREY}$ ${RESET}'
