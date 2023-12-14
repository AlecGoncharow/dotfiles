#!/bin/zsh

function frg {
  result=$(rg --ignore-case --color=always --line-number --no-heading "$@" |
    fzf --ansi \
    --color 'hl:-1:underline,hl+:-1:underline:reverse' \
    --delimiter ':' \
    --preview "bat --color=always {1} --theme='gruvbox-dark' --highlight-line {2}" \
    --preview-window 'up,60%,border-bottom,+{2}+3/3,~3')
      file=${result%%:*}
      linenumber=$(echo "${result}" | cut -d: -f2)
      if [[ -n "$file" ]]; then
        nvim +"${linenumber}" "$file"
      fi
}

alias rgf=frg
