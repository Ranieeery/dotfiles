# vim ~/.p10k.zsh

function prompt_my_dir {
  echo -n $(basename "$(pwd)")
}

POWERLEVEL9K_CUSTOM_DIR="prompt_my_dir"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
