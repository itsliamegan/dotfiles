function set_variables
  set NAME "Liam Egan"
  set EMAIL liam@liamegan.com
  set EDITOR emacs
end

function override_defaults
  function fish_prompt
    set_color blue
    echo (string replace $HOME "~" $PWD)
    set_color --bold purple
    echo -n "❭ "
    set_color white
  end

  function fish_greeting
  end
end

function add_directories_to_path
  set --global --export PATH ~/.cask/bin ~/.composer/vendor/bin vendor/bin (npm bin -g) (npm root -g) $PATH
end

function add_directories_to_cd_path
  set --global --export CDPATH ~/Projects ~ . $CDPATH
end

function manage_language_versions
  source /usr/local/share/chruby/chruby.fish
  source /usr/local/share/chruby/auto.fish
end

set_variables
override_defaults
add_directories_to_path
add_directories_to_cd_path
manage_language_versions
