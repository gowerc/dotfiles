
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

# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""  # Turning off theme as we will load pure later

### ZSH Auto Suggestion
###    - Fish like suggestions that automatically appear as your type
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_STRATEGY=(completion history  match_prev_cmd)
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20    # Stop auto complete for large buffers


### Add brew to auto complete (mac-OS only)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi


### Pure Theme
export ZSH_THEME=""
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


### Enable oh-my-zsh plugins
plugins=(docker docker-compose)


### Enable oh-my-zsh
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"


if [ -r $HOME/.profile_common ] ; then
  source $HOME/.profile_common
fi








# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH





# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


