# should be sourced in ~/.bashrc

# aliases
alias dwarves='cd ~/Downloads/df_linux && ./df && cd'
alias ret='echo -e "Restarting network-manager... " && sudo service network-manager restart && echo -e "Done"'
alias wp='cd && clear'
alias cl='clear'
alias current='cd ~/Documents/YCPS2So/CS320'
alias inf='cd ~/Documents/Inform6/inform6Projects'
alias dia='nano ~/Documents/diary.txt'

# functions
function cs () {
	cd "$@" && ls 
}

function ainst () {
    sudo apt-get install "$@"
}

# run commands
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi
