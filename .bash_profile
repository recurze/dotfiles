#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && source ~/.bashrc

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx &> $HOME/startx.log
fi
