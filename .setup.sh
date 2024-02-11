if  grep -q "$PWD/.bash-prompt.sh" ~/.bashrc ; then
    echo '.bashrc setup already Done' ;

else
    sudo tee -a ~/.bashrc<<EOF

# customize bash prompt
if [ -f $PWD/.bash-prompt.sh ]; then
    . $PWD/.bash-prompt.sh
fi
EOF

    echo '.bashrc setup Done' ;
fi



if  grep -q "$PWD/.git-prompt.sh" "$PWD/.bash-prompt.sh" ; then
    echo '.bash-prompt.sh setup already Done' ;

else
    sudo tee -a "$PWD/.bash-prompt.sh"<<EOF

# if .git-prompt.sh exists, set options and execute it
if [ -f $PWD/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . $PWD/.git-prompt.sh
fi
EOF

    echo '.bash-prompt.sh setup Done' ;
fi
