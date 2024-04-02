
#############################
#
# Setup
#
#


### Install ZSH
# sudo apt install zsh
# sudo dnf install zsh


### Install oh-my-zsh (plugin-manager) - https://ohmyz.sh/#install
# sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"


### Add directory for user installed stuff
# mkdir -p "$HOME/.zsh"


### Install Pure Theme
# git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
# ln -s "$HOME/.zsh/pure/pure.zsh" "$HOME/.zsh/zfunctions/prompt_pure_setup"


### Install autocompletions
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions


### Path to your oh-my-zsh installation.
# export ZSH=


#############################
#
# Activation
#
#


### ZSH Auto Suggestion
###    - Fish like suggestions that automatically appear as your type
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_STRATEGY=(completion history  match_prev_cmd)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20    # Stop auto complete for large buffers


### Add brew to auto complete (mac-OS only)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi


### Enable oh-my-zsh plugins
plugins=(docker docker-compose)
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"


### Pure Theme
export PURE_PROMPT_SYMBOL=">"
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure
# Change styles of prompt symbol based on "sucess" and "failure"
zstyle :prompt:pure:prompt:success color '#2215DD'
zstyle :prompt:pure:prompt:error color '#FF2828'


### Enable zsh's completion system
###      - completion files are search for in $fpath
autoload -U compinit
compinit -d "$HOME/.zsh/.zcompdump"  # Redirect cache files

if [ -r $HOME/.profile_common ] ; then
  source $HOME/.profile_common
fi

