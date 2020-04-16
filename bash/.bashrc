source ~/.bashrc.d/variables.bash
source ~/.bashrc.d/prompt.bash
source ~/.bashrc.d/path.bash
source ~/.bashrc.d/aliases.bash

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

for completion_file in /etc/bash_completion.d/*; do
  source $completion_file
done
