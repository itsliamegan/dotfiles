# Liam's Dotfiles

These are my personal dotfiles. I use Debian on a ThinkPad T450s and X220. The
The main programs I use are Emacs, i3, bash, and Ruby, so most of the
configuration here is for those. I also have my vim configuration lying around
in case I feel like playing around in vim (as I occasionally do). I used to use
tmux and zsh, so you can find those configuration files in the repository's
history.

## Installation and Setup

From a fresh install of Debian, there are a few things you need to do before
using this repository. After boot, you must install sudo and git as root via
apt. Then, you can clone this repository into a directory for your dotfiles - I
use ~/dotfiles. Because of the way that GNU stow works, this directory must be
directly inside your home directory! i.e. ~/dotfiles will work, but
~/projects/dotfiles won't. After that, run ./install.sh and wait while all the
necessary packages are installed and files are symlinked. After that, you should
be all set!
