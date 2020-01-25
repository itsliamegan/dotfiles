echo "Setting up all your dotfiles!"

# vim

echo "Installing the vundle plugin manager for vim..."

mkdir ./.vim/bundle
( cd ./.vim/bundle && git clone git@github.com:VundleVim/Vundle.vim.git )

echo "Installing vim plugins..."

vim +PluginInstall +qall

# zsh

echo "Installing zsh..."

sudo apt install zsh -y

echo "Installing Oh My Zsh!..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# tmux

echo "Installing tmux"

sudo apt install tmux -y

echo "Linking the basic dotfiles to your home directory..."

ln -sf "$PWD/.vimrc" ~/.vimrc
ln -sf "$PWD/.zshrc" ~/.zshrc
ln -sf "$PWD/.tmux.conf" ~/.tmux.conf
ln -sf "$PWD/.vim" ~/.vim
