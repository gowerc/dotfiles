

### Set git branch + dirty indictor
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}
function parse_git_dirty {
  [[ -n "$(git status -s 2> /dev/null)" ]] && echo "*"
}

export VIRTUAL_ENV_DISABLE_PROMPT=TRUE

export PS1='
${VIRTUAL_ENV:+(venv) }\
\[\e[38;5;28m\]$(pwd)\[\e[0m\] \
\[\e[38;5;177m\]$(parse_git_branch)\[\e[0m\]\n\
\[\033[38;5;165;1m\]> \[\e[0m\]'

if [ -r $HOME/.profile_common ] ; then
  source $HOME/.profile_common
fi
