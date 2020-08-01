alias ..="c .."
alias ...="c ../.."
alias ....="c ../../.."

alias ps='ps -A'
alias du='du -sbh'
alias ls='ls -ph'
alias mpv='mpv --sub-file-paths=.:subs'
alias diff='diff -N'
alias free='free -ht'
alias mkdir='mkdir -p'
alias aria2c='aria2c --file-allocation=none -c -x 10 -s 10 -d .'
alias ydl="youtube-dl --write-sub --sub-lang en -f 'bestvideo[height<=480]+bestaudio'"

alias vi='vim'
alias ff='firefox 2>/dev/null &'
alias feh='feh -F'
alias mus='mpv --no-video'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

alias setcl='xclip -selection c'
alias getcl='xclip -selection c -o'
alias gethl='xclip -o' #default selection is XA_PRIMARY (last highlighted text)
