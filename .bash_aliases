alias ..="c .."
alias ...="c ../.."
alias ....="c ../../.."

alias ps='ps -A'
alias du='du -sbh'
alias ls='ls -ph'
alias mpv='mpv --save-position-on-quit --sub-file-paths=.:subs'
alias diff='diff -N'
alias free='free -ht'
alias mkdir='mkdir -p'
alias aria2c='aria2c --file-allocation=none -c -x 10 -s 10 -d .'
alias ydl="youtube-dl --write-sub --sub-lang en -f 'bestvideo[height<=480]+bestaudio'"
alias bton="bluetoothctl <<< 'power on'"

alias vi='nvim'
alias ff='firefox 2>/dev/null &'
alias feh='feh -F'
alias mus='mpv --no-video'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

alias setcl='xclip -selection c'
alias getcl='xclip -selection c -o'
alias gethl='xclip -o' #default selection is XA_PRIMARY (last highlighted text)

alias todo='vi ~/.todo'
alias reduce_pdf_size='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dBATCH  -dQUIET -sOutputFile=reduced.pdf '

alias brb='slock'
alias away='slock & systemctl suspend'
alias pulseUI='/opt/pulsesecure/bin/pulseUI'
alias swapcaps='setxkbmap -option caps:swapescape'
alias wifi='iwctl <<< echo station wlan0'
alias flake8='flake8 --max-line-length 120'

alias testcam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"
