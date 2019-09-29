# should be sourced in ~/.bashrc

# aliases
alias ret='echo -e "Restarting network-manager... " && sudo service network-manager restart && echo -e "Done"'
alias wp='cd && clear'
alias cl='clear' #ctrl-l

# quick dir pullup for semester
alias cur='cd ~/Documents/YCPS1Se'
alias scs='ssh jhorne@cscluster.ycp.edu'

#alias inf='cd ~/Documents/Inform6/inform6Projects'
alias dwf='cd ~/Documents/df_44_12_linux/df_linux && ./df && cd'
alias dia='nano -t ~/Documents/diary.txt'
alias src='source ~/.bashrc'

# functions
function cs () {
	cd "$@" && ls 
}

function agi () {
    sudo apt-get install "$@"
}

function ltyp () {
	la | grep -E "\.${@}$"
}

# run commands
if [[ ! $TERM =~ screen ]]; then
    exec tmux
fi

# getting sick of this tqbh
#fortune -a | cowsay
