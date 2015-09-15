# you can set up aliases for common things
# it's super easy
alias orbot="ssh -i ~/.ssh/atlas/orbot_keypair.pem ubuntu@54.174.14.69"

# COLORS !
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
PS1='\n\e[0;33m\w\e[m\n\u@\h: '
git config --global color.ui true


alias ls='ls -F'
alias ll='ls -l -h'
alias la='ls -a'

# super useful git log view
alias gitlg="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)'"
alias s="git status -s"

# may require adjustment, but can be used like `subl .`
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# serve files from your current location
alias serve='python -m SimpleHTTPServer'
# same thing, more performant, installed by default on a mac
alias sserve='twistd -n web -p 8887 --path .'

# move things to trash instead of actualyl rm-ing, works on dirs
function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}
