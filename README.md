# Liam's Dotfiles

These are my personal dotfiles. I use Debian on a ThinkPad T450s and
X220. The main programs I use are vim, i3, and ruby, so most of the
configuration here is for those. At various points I used Emacs and tmux, so
check the repository history for those files.

## Installation and Setup

From a fresh install of Debian, there are a few things you need to do
before using this repository. After boot, you must install sudo and
git as root via apt. Then, you can clone this repository into a
directory for your dotfiles - I use ~/dotfiles. After that, run
./install.sh and wait while all the necessary packages are installed
and files are symlinked. After that, you should be all set!
