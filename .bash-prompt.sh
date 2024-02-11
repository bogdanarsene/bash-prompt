# Add git info to prompt
# store colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[34;01m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[00;32m\]"
RED="\[\033[0;31m\]"
VIOLET='\[\033[01;35m\]'
DARK_GREY="\[\033[1;30m\]"


# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="${VIOLET}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
  fi
}


function color_my_prompt {
  local __time_date="$DARK_GREY\D{%Y-%m-%d} \t"
  local __user_and_host="$LIGHT_GRAY\u$YELLOW@$GREEN\h $YELLOW\l"
  local __cur_location="$BLUE\w"           # capital 'W': current directory, small 'w': full file path
  local __git_branch_color="$GREEN"
  local __prompt_tail="\n$LIGHT_GRAY└─ $YELLOW$"
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

  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv

  # Build the PS1 (Prompt String)
  PS1="\n[$__time_date] $__user_and_host ${PYTHON_VIRTUALENV} $__cur_location$__git_branch_color$__git_branch $__prompt_tail$__user_input_color "
}

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt

# if .git-prompt.sh exists, set options and execute it
if [ -f /home/bogdan/Repos/bash-prompt/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . /home/bogdan/Repos/bash-prompt/.git-prompt.sh
fi
