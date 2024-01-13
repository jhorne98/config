# should be sourced in ~/.bashrc

# store colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[00;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[01;36m\]"
GREEN="\[\033[00;32m\]"
RED="\[\033[01;31m\]"
VIOLET='\[\033[01;35m\]'
WHITE='\[\033[01;37m\]'
 
function color_my_prompt {
  local __user_and_host="$CYAN\u$LIGHT_GRAY@$RED\h"
  local __cur_location="$GREEN\W"           # capital 'W': current directory, small 'w': full file path
  local __git_branch_color="$GREEN"
  local __prompt_tail="$VIOLET$"
  local __user_input_color="$LIGHT_GRAY"
  local __git_branch=$(__git_ps1);
  
  # colour branch name depending on state
  if [[ "${__git_branch}" =~ "*" ]]; then     # if repository is dirty
      __git_branch_color="$RED"
  elif [[ "${__git_branch}" =~ "$" ]]; then   # if there is something stashed
      __git_branch_color="$YELLOW"
  elif [[ "${__git_branch}" =~ "%" ]]; then   # if there are only untracked files
      __git_branch_color="$LIGHT_GRAY"
  elif [[ "${__git_branch}" =~ "+" ]]; then   # if there are staged files
      __git_branch_color="$CYAN"
  fi
   
  # Build the PS1 (Prompt String)
  PS1="$WHITE[$__user_and_host $__cur_location$WHITE]$__git_branch_color$__git_branch $__prompt_tail$__user_input_color "
}
 
# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt
 
# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi

# aliases
alias wp='cd && clear'
alias cl='clear' #ctrl-l
alias cls='clear'
alias ll='ls -la'
alias la='ls -a'
alias gka='gitk --all &'

#alias inf='cd ~/Documents/Inform6/inform6Projects'
#alias dwf='cd ~/Documents/df_44_12_linux/df_linux && ./df && cd'
alias src='source ~/.bashrc'

# functions
function cs () {
	cd "$@" && ls 
}

function inst () {
    sudo apt install "$@"
}

function ltyp () {
	la | grep -E "\.${@}$"
}

# getting sick of this tqbh
#fortune -a | cowsay
