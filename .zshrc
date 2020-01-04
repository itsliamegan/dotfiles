# Path to oh-my-zsh installation.
export ZSH="/home/liam/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Set vim as the default editor
export EDITOR="vim"

export TERM=xterm-256color

# Add rbenv to the PATH and start it
export PATH="$PATH:/home/liam/.rbenv/bin"
eval "$(rbenv init -)"

# Configure and start nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Disable C-s and others from stopping/resuming program output
stty sane
stty stop ""
stty start ""
stty werase ""

# Map CapsLock to Esc
xmodmap -e "clear Lock" -e "keycode 0x42 = Escape"

# Git aliases

git config --global alias.c "commit"
git config --global alias.d "diff"
git config --global alias.s "status"
git config --global alias.p "push"
git config --global alias.anoe "commit --amend --no-edit"
