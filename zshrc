
# https://carlosroso.com/the-right-way-to-migrate-your-bash-profile-to-zsh/

# export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# move to setup_computer.sh
# defaults write com.apple.finder AppleShowAllFiles -boolean true;
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# defaults write com.apple.screencapture location /Users/zach/Desktop/screenshots

# based on $AWS_DEFAULT_PROFILE
alias awswho="aws iam get-user"

# just some nice helpers
alias ls='ls -F'
alias ll='ls -l -h'
alias la='ls -a'
# get the total size of all dirs
alias lss='du -sh *'

# recursively print what's in the cwd,  via http://askubuntu.com/a/431252
alias rpfiles="find . | sed 's|[^/]*/|- |g'"
alias rpdirs="find . -type d | sed -e 's/[^-][^\/]*\//  |/g' -e 's/|\([^ ]\)/|-\1/'"

alias serve='python -m SimpleHTTPServer'


export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

git config --global color.ui true
alias gitlg="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)' -$(expr $(tput lines) - 8)"
alias gitlga="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)'"

alias s="git status -s"

alias awswho="aws iam get-user"


# PS1='\n\e[0;33m\w\e[m\n\[\03d3[38;5;37m\]\@\[$(tput sgr0)\] \u@\h$(__git_ps1 " (on \e[0;35m\]%s\[\e[0m\])")\[\e[33m\]$(__docker_machine_ps1)\[\e[m:\n▶ '

# allow deletion of dirs - and put stuff in trash
# added /bin/ to mv so it works in zsh
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
      /bin/mv "$path" ~/.Trash/"$dst"
    fi
  done
}


# these *were* in input rc
#
bindkey "^R" history-incremental-search-backward
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
# no work in zsh
# set completion-ignore-case On
# evidently equiv, https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
# but causes a warning when none exist
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 


# and this is the git ui enhancements, equiv was in bash_profile

# https://github.com/olivierverdier/zsh-git-prompt#install
source ~/dotfiles/zsh-git-prompt-master/zshrc.sh
# the prompt
PROMPT="%B%m%~%b$(git_super_status)%t"$'\n'"▶ "


# https://stackoverflow.com/a/26479426
# autoload -U compinit && compinit
# zmodload -i zsh/complist

# https://stackoverflow.com/a/41767727
# auto-completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi
# vs
# Add the following line to your ~/.bash_profile:
# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
