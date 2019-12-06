echo "Setting up all your dotfiles!"

# vim

echo "Installing pathogen for vim, a simple plugin manager..."

mkdir -p ./.vim/autoload ./.vim/bundle
curl -LSso ./.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing the following plugins for vim:"

echo "* CtrlP"
( cd ./.vim/bundle && git clone git@github.com:kien/ctrlp.vim.git )

echo "* UltiSnips"
( cd ./.vim/bundle && git clone git@github.com:sirver/ultisnips.git )

echo "* MatchIt"
( cd ./.vim/bundle && git clone git@github.com:adelarsq/vim-matchit.git )

echo "* EditorConfig Support"
( cd ./.vim/bundle && git clone git@github.com:editorconfig/editorconfig-vim.git )

echo "* TypeScript Support"
( cd ./.vim/bundle && git clone git@github.com:leafgarland/typescript-vim.git )

echo "* Color Themes"
( cd ./.vim/bundle && git clone git@github.com:vim-scripts/xoria256.vim.git )
( cd ./.vim/bundle && git clone git@github.com:vim-scripts/twilight256.vim.git )
( cd ./.vim/bundle && git clone git@github.com:jpo/vim-railscasts-theme.git )


# zsh

echo "Installing zsh..."

sudo apt install zsh -y

echo "Installing Oh My Zsh!..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# tmux

echo "Installing tmux"

sudo apt install tmux -y

echo "Backing up your current dotfiles..."

mv ~/.vimrc ~/.vimrc.old
mv ~/.zshrc ~/.zshrc.old
mv ~/.tmux.conf ~/.tmux.conf.old

echo "Linking the basic dotfiles to your home directory..."

ln -sf "$PWD/.vimrc" ~/.vimrc
ln -sf "$PWD/.zshrc" ~/.zshrc
ln -sf "$PWD/.tmux.conf" ~/.tmux.conf
ln -sf "$PWD/.vim" ~/.vim
