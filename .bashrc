#------------#
# BASIC INFO #
#------------#

export NAME="Liam Egan"
export EMAIL="liam@liamegan.com"
export EDITOR=vim
export TERM=xterm-256color

#------#
# PATH #
#------#

export PATH=~/.cargo/bin:$PATH
export CDPATH=.:~/Code

#--------#
# PROMPT #
#--------#

formatted_git_branch() {
  branch=$(git branch 2>/dev/null | grep "^*" | sed "s/* \(.*\)/\1/")
	changes=""
  unstaged_changes=$(git diff HEAD 2>/dev/null)
  untracked_files=$(git ls-files --others --exclude-standard 2>/dev/null)

  if [[ -z $branch ]]; then
    echo ""
    exit 0
  fi

  if [[ ! -z $unstaged_changes || ! -z $untracked_files ]]; then
    changes="*"
  fi

  # echo " ($branch$changes) "
  # echo "[$branch$changes]"
  # printf " [\001\033[32m\002$branch$changes\001\033[00m\002] "
  printf " (\001\033[32m\002$branch$changes\001\033[00m\002) "
}

# export PS1="\[\033[00m\]\u\[\033[00m\]:\[\033[33m\]\W\[\033[00m\]\$(formatted_git_branch) \[\033[31m\]$\[\033[00m\] "
# export PS1="\[\033[94m\]\w\[\033[00m\]\$(formatted_git_branch)$ "
# export PS1="\[\033[32m\]\u@\h: \[\033[34m\]\w\n\[\033[00m\]$ "
# export PS1="\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[00m\] $ "
# export PS1="\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[00m\]\$(formatted_git_branch)$ "
# export PS1="[\[\033[94m\]\w\[\033[00m\]]\$(formatted_git_branch)\[\033[93m\] $ \[\033[00m\]"
# export PS1="\[\033[35m\][\[\033[32m\]\u\[\033[35m\]] \[\033[33m\]\w\[\033[00m\]\$(formatted_git_branch)$ "
# export PS1="\[\033[33m\]\w\[\033[00m\]\$(formatted_git_branch)\n\[\033[32m\]$\[\033[00m\] "
# export PS1="\[\033[32m\][\w] $ \[\033[00m\]"
# export PS1="\[\033[33m\]\w\[\033[00m\]\$(formatted_git_branch)\n\[\033[00m\]$ "
# export PS1="[\u] \w \$ "
export PS1="[\u] \[\033[32m\]\w \[\033[33m\]\$\[\033[00m\] "

#---------#
# HELPERS #
#---------#

alias cd="cd >/dev/null"
alias ls="ls -GF"
alias tree="tree -CF"
alias rg="rg --colors=path:fg:yellow"

# Download a youtube video as an MP4.
download-youtube-video() {
	youtube-dl $1 --output $2.mp4 --format "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"
}

# Download and then open a youtube video
watch-youtube-video() {
  download-youtube-video $1 $2 && open $2.mp4
}

# Download the audio from a youtube video as an MP3.
download-youtube-audio() {
	youtube-dl $1 --output $2.mp4 --extract-audio --audio-format mp3
}

# Open a man page in an easy to read viewer.
open-manual() {
  man -t $1 | open -f -a Preview;
}

#----------------#
# COMMAND CONFIG #
#----------------#

export LSCOLORS="exgxcxdxbxegedabagacad"

export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS="--color=16,bg+:0,fg+:3,hl:2,hl+:2"

#------------------#
# LANGUAGE TOOLING #
#------------------#

source $(brew --prefix asdf)/asdf.sh

#-------------#
# COMPLETIONS #
#-------------#

if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  source $(brew --prefix)/etc/bash_completion
fi

# Disable expansion of "~".
_expand() {
  return 0
}
