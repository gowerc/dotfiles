
if [ -r ~/.bash_profile ] ; then 
    if ! grep -qF '.bashrc' ~/.bash_profile ; then
        . ~/.bash_profile
    else
        echo "Unable to load '.bash_profile' as it contains reference to '.bashrc'"
    fi
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


