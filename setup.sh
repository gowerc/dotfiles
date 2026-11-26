

# Ensure directories exist so the whole directory isn't symlinked
mkdir -p \
    $HOME/.config/code \
    $HOME/.config/ghostty \
    $HOME/.config/nvim \
    $HOME/.config/rstudio \
    $HOME/.local/bin

stow --ignore setup.sh --target=$HOME .
