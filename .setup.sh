if  grep -q "$PWD/.bash-prompt.sh" ~/.bashrc ; then
    echo 'Setup already Done' ;

else
    sudo tee -a ~/.bashrc<<EOF

# customize bash prompt
if [ -f $PWD/.bash-prompt.sh ]; then
    . $PWD/.bash-prompt.sh
fi
EOF

    echo 'Setup Done' ;
fi
