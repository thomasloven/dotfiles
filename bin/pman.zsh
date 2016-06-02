#!/bin/zsh


pman() { 

  if [[ -z $1 ]]; then
    pman.py;
    return
  fi

  special=("help" "list" "del")
  for x in $special; do
    if [[ $1 == $x ]]; then
      pman.py $@;
      return
    fi
  done

  if [[ `uname` == 'Darwin' ]]; then
    pman.py $@ | pbcopy ;
    echo `pbpaste`;
    echo 'The generated password has been placed in your clipboard'
  else
    pman.py $@
  fi
}
_pman() { compadd help list del `pman.py list`; }
compdef _pman pman

