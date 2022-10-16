# should be sourced in ~/.bashrc

# PS1 with current git branch
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\[\033[01;32m\][\[\033[01;31m\]\u\[\033[01;32m\]@\h\[\033[01;37m\] \w\[\033[01;32m\]]\[\033[01;34m\]\$(parse_git_branch)\[\033[01;32m\]\$\[\033[00m\] "

# aliases
alias wp='cd && clear'
alias cl='clear' #ctrl-l
alias cls='clear'
alias ll='ls -la'
alias la='ls -a'
alias gka='gitg --all &'

#alias inf='cd ~/Documents/Inform6/inform6Projects'
#alias dwf='cd ~/Documents/df_44_12_linux/df_linux && ./df && cd'
alias src='source ~/.bashrc'

# functions
function cs () {
	cd "$@" && ls 
}

function inst () {
    sudo pacman -Syu "$@"
}

function ltyp () {
	la | grep -E "\.${@}$"
}

# getting sick of this tqbh
#fortune -a | cowsay
