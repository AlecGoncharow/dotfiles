source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo.
antigen bundle git
# antigen bundle refined
antigen bundle command-not-found
antigen bundle vi-mode

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# Load the theme.
antigen bundle mafredri/zsh-async
#antigen bundle DFurnes/purer
antigen bundle sindresorhus/pure
# Tell Antigen that you're done.
antigen apply


################################################
bindkey -v


alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
