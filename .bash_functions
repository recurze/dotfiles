c() {
    cd "$1" && ls -ph
}

df() {
    zathura --mode fullscreen "$1" 2>/dev/null &
}

val() {
    python3 -c "print($@)"
}

batstatus(){
    P=$(cat /sys/class/power_supply/BAT0/capacity)
    echo -e ${P}%
}

conv() {
    libreoffice --headless --invisible --convert-to $@ 2>&1 >/dev/null
}

alert(){
    if [ $? -eq 0 ]; then
        msg=Completed
    else
        msg=Error
    fi
    cmd="$(history|tail -n1|sed -e 's/^\s*[0-9]\+\s*//'|sed -e 's/[;&|]\s*alert$//')"
    notify-send "$cmd" "$msg"
}

run() {
    g++ -pg -DLOCAL -std=c++17 -Wall -Wextra -Wshadow -Wconversion -Wunused -Wreorder -Woverflow -pedantic -fsanitize=address -fsanitize=undefined $1.cpp && ./a.out
}

prep() {
    dir=$1
    cd ~/ && \mkdir $dir && cd $dir
    cp ~/Competitive-Programming/copy_me.cpp $dir/
    for i in a b c d; do cp ~/Competitive-Programming/copy_me.cpp $i.cpp; done
}
