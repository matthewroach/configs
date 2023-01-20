# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH="{path-here}/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

prompt_dir() {
  #prompt_segment blue $CURRENT_FG '%~'
  prompt_segment blue $CURRENT_FG '%1~'
}

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
  #  prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

precmd() {
    if [[ "$NEW_LINE" = true ]] then
        if [[ "${ADD_NEW_LINE}" = true ]] then
            PROMPT=$'\n'"${PROMPT}"
            ADD_NEW_LINE=false
        fi
    else
        PROMPT="${PROMPT}"
        NEW_LINE=true
        ADD_NEW_LINE=true
    fi
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  CURRENT_BG=''
  echo -n "\e[m\n➜%{%f%}"
}
