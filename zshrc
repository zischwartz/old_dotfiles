
# https://carlosroso.com/the-right-way-to-migrate-your-bash-profile-to-zsh/

# export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for android studio
[ -d "$HOME/Library/Android/sdk" ] && ANDROID_SDK=$HOME/Library/Android/sdk || ANDROID_SDK=$HOME/Android/Sdk
echo "export ANDROID_SDK=$ANDROID_SDK" >> ~/`[[ $SHELL == *"zsh" ]] && echo '.zshenv' || echo '.bash_profile'`

echo "export PATH=$HOME/Library/Android/sdk/platform-tools:\$PATH" >> ~/`[[ $SHELL == *"zsh" ]] && echo '.zshenv' || echo '.bash_profile'`


# move to setup_computer.sh
# defaults write com.apple.finder AppleShowAllFiles -boolean true;
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# defaults write com.apple.screencapture location /Users/zach/Desktop/screenshots

# based on $AWS_DEFAULT_PROFILE
alias awswho="aws iam get-user"

# assumes hub is installed !
# alias git=hub

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
NEWLINE=$'\n'
PROMPT='%B%m%~%b$(git_super_status)%t${NEWLINE}▶'

# FIX FOR ZSH GIT PROMPT  https://github.com/olivierverdier/zsh-git-prompt/issues/153#issuecomment-1070452245
alias python=/usr/local/bin/python3

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zach/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zach/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zach/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zach/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/zach/Downloads/cocos2d-x-4.0/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/zach/Downloads"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/zach/Downloads/cocos2d-x-4.0/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
