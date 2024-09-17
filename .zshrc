zsh::init () {
  autoload -Uz add-zsh-hook
  autoload -U colors && colors
  autoload -Uz compaudit
  compaudit
  autoload -Uz compinit
  compinit -C -d $HOME/.zcompdump
}

zsh::cdpath::init() {
  cdpath=()
  cdpath+="$HOME/Workspace/DOTFILES"
}

zsh::history::init() {

}

zsh::colors::init() {
  . "$HOME/Workspace/ZSH-USERS/zsh-syntax-highlighting.zsh"
}

homebrew::bootstrap() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

shell::path::init() {
  # PATH=""
  export PATH="$PATH:/usr/local/bin"
  export PATH="$PATH:/usr/local/sbin"
  export PATH="$PATH:/usr/bin"
  export PATH="$PATH:/usr/sbin"
  export PATH="$PATH:/bin"
  export PATH="$PATH:/sbin"
  export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
  export PATH="$PATH:/home/linuxbrew/.linuxbrew/sbin"
}

homebrew::init() {
  local homebrew_prefix=$(brew --config | awk -F: '/PREFIX/ { print $2 }' | sed -e 's, ,,g')
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_EDITOR=vim
  export HOMEBREW_PREFIX=$homebrew_prefix
}

rbenv::init() {
  eval "$(~/.rbenv/bin/rbenv init - zsh)"
}

zsh::init
zsh::cdpath::init
zsh::history::init
zsh::colors::init
shell::path::init
homebrew::init
rbenv::init
