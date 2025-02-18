

### Set git branch + dirty indictor
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
function parse_git_dirty {
  [[ -n "$(git status -s 2> /dev/null)" ]] && echo "*"
}

export VIRTUAL_ENV_DISABLE_PROMPT=TRUE


if [ -r $HOME/.profile_common ] ; then
  source $HOME/.profile_common
fi


export TPUT_RED="$(tput setaf 196)"
export TPUT_BLUE="$(tput setaf 20)"
export TPUT_GREEN="$(tput setaf 28)"
export TPUT_FAINT_PURPLE="$(tput setaf 177)"
export TPUT_PURPLE="$(tput setaf 165)"
export TPUT_BOLD="$(tput bold)"    # bold
export TPUT_UND="$(tput smul)"     # underline
export TPUT_END="$(tput sgr0)"     # end all enhancements


export PS1='
${VIRTUAL_ENV:+(venv) }\
${TPUT_BLUE}${NICKNAME}${TPUT_END}${NICKNAME:+ - }\
${TPUT_GREEN}$(pwd)${TPUT_END} \
${TPUT_FAINT_PURPLE}$(parse_git_branch)${TPUT_END}\n\
${TPUT_BOLD}${TPUT_PURPLE}> ${TPUT_END}'

