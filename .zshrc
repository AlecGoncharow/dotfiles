# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch AUTO_PUSHD
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alec/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
alias sudo='sudo '
alias cat='bat'

export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig cargo build

#
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo.
#antigen bundle git
# antigen bundle refined
#antigen bundle command-not-found
#antigen bundle vi-mode

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# suggestions
antigen bundle zsh-users/zsh-autosuggestions
# Load the theme.
#antigen bundle mafredri/zsh-async
#antigen bundle DFurnes/purer
#antigen bundle sindresorhus/pure
# Tell Antigen that you're done.
antigen apply

eval "$(starship init zsh)"
