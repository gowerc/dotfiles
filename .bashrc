
[ -r ~/.bash_profile ] && ! grep -qF '.bashrc' ~/.bash_profile && . ~/.bash_profile

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

