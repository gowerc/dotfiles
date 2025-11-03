
# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

#
# Source bash_profile:
#
#     Note that all config should really go in this file unless
#     there is a good reason as to why it shouldn't be loaded in
#     the non-login shells
#
#     Remember:
#         login-shell             = bash_profile
#         interactive (non-login) = bashrc
#
if [ -r ~/.bash_profile ] ; then 
    if ! grep -qF '.bashrc' ~/.bash_profile ; then
        source ~/.bash_profile
    else
        echo "Unable to load '.bash_profile' as it contains reference to '.bashrc'"
    fi
fi

