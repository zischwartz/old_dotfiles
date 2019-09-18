
alias ls='ls -F'
alias ll='ls -l -h'
alias la='ls -a'
alias lss='du -sh *'

alias imessage='~/dotfiles/imessage.sh'

# teehee
alias weather='curl wttr.in/brooklyn'

# recursively print what's in the cwd,  via http://askubuntu.com/a/431252
alias rpfiles="find . | sed 's|[^/]*/|- |g'"
alias rpdirs="find . -type d | sed -e 's/[^-][^\/]*\//  |/g' -e 's/|\([^ ]\)/|-\1/'"

# sierra mac os ssh-agent issue
# https://github.com/lionheart/openradar-mirror/issues/15361#issuecomment-267367902
{ eval `ssh-agent`; ssh-add -A; } &>/dev/null

alias serve='python -m SimpleHTTPServer'
alias sserve='twistd -n web -p 8887 --path .'

alias git=hub

alias dockerkillall='docker kill $(docker ps -q)'
alias dockerrmlast='docker rm -f  $(docker ps -aq | head -1)'
alias dockerloglast='docker logs -f  $(docker ps -q | head -1)'
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# via https://docs.docker.com/docker-for-mac/docker-toolbox/#setting-up-to-run-docker-for-mac
# once you've connected via docker-machine, use this to go back to docker for mac
alias docker4mac='unset DOCKER_TLS_VERIFY; unset DOCKER_CERT_PATH; unset DOCKER_MACHINE_NAME; unset DOCKER_HOST'

# to run gui apps from within docker
# https://github.com/chanezon/docker-tips/tree/master/x11
# XXX requires `brew install Caskroom/cask/xquartz`
# double XXX couldn't get this to work, giving up for now
# export DISPLAY_MAC=`ifconfig en0 | grep "inet " | cut -d " " -f2`:0
# function startx() {
# 	if [ -z "$(ps -ef|grep XQuartz|grep -v grep)" ] ; then
# 	    open -a XQuartz
#         socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
# 	fi
# }


export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export GHI_PAGER=cat

# my own bin!
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/sbin
# http://jruby.org/#2
# export PATH=$PATH:/Library/jruby-9.1.8.0/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export GOREILLY="src/github.com/oreillymedia"
alias goreilly="cd $GOPATH/$GOREILLY"
alias zo="cd $GOPATH/src/github.com/zischwartz"


export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# from http://superuser.com/a/819222
# and http://stackoverflow.com/a/26132452/83859
# for docker tag completion
# if [ -f `brew --prefix`/etc/bash_completion ]; then
#     . `brew --prefix`/etc/bash_completion
# fi

# PS1="\n\e[0;33m\w\e[m\n\u@\h  sez:\n"
# PS1='\n\e[0;33m\w\e[m\n\u@\h $(__git_ps1 "(on \e[0;35m\]%s\[\e[0m\]) ")sez:\n'
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '


# PS1='\n\e[0;33m\w\e[m\n\[\033[38;5;37m\]\@\[$(tput sgr0)\] \u@\h$(__git_ps1 " (on \e[0;35m\]%s\[\e[0m\])"):\n▶ '

# Current
# PS1='\n\e[0;33m\w\e[m\n\[\033[38;5;37m\]\@\[$(tput sgr0)\] \u@\h$(__git_ps1 " (on \e[0;35m\]%s\[\e[0m\])")\[\e[33m\]$(__docker_machine_ps1)\[\e[m:\n▶ '

# with aws thing
PS1='\n\e[0;33m\w\e[m\n\[\033[38;5;37m\]\@\[$(tput sgr0)\] \u@\h$(__git_ps1 " (on \e[0;35m\]%s\[\e[0m\])")\[\e[33m\]\e[31;46m\]$AWS_DEFAULT_PROFILE\[\e[m\]\[\e[m:\n▶ '

# just my aws thing, added above
# PS1='\e[31;46m\]`\$AWS_DEFAULT_PROFILE`\[\e[m\]'

git config --global color.ui true
alias gitlg="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)' -$(expr $(tput lines) - 8)"
alias gitlga="git log --pretty=format:'%C(yellow)%h%Cred%d%Creset - %C(cyan)%an %Creset: %s %Cgreen(%cr)'"

alias s="git status -s"

# based on $AWS_DEFAULT_PROFILE
alias awswho="aws iam get-user"

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

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
source ~/.git-completion.sh
# from https://github.com/git/git/tree/master/contrib/completion
source ~/.git-prompt.sh
# https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

# $(__docker_machine_ps1)
# http://blog.scottlowe.org/2016/03/28/adding-git-docker-machine-awareness-osx/
source ~/.docker-machine-prompt

# use the built in completer for aws cli
# of course this requires aws cli
complete -C aws_completer aws

# trying this out, in theory this writes to my bash history immediately instead of only on close
# https://askubuntu.com/a/67306
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"



# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zach/google-cloud-sdk/path.bash.inc' ]; then . '/Users/zach/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zach/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/zach/google-cloud-sdk/completion.bash.inc'; fi
