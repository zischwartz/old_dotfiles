# WIP

# install pathogen for vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Disable annoying warning about changing your extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# removed old docker stuff now that there's docker for mac.
# TODO automate dfm, I guess brew+cask

# get brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# and cask
brew tap caskroom/cask
# some nice quicklook plugins, based on https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize suspicious-package qlvideo

# can't use cask for this one !
echo "https://github.com/tuxu/ipynb-quicklook"
# https://github.com/tuxu/ipynb-quicklook

# needs to be sudo, this fixes issues later on with things installed with brew

echo "You should create these directories and change their ownership to your account.
   sudo mkdir -p /usr/local/sbin
   sudo chown -R $(whoami) /usr/local/sbin"

# some nice node utils
# but actually, you should install node first! TODO
# npm install --global pretty-bytes-cli gzip-size-cli

# github stuff that's nice
brew install ghi hub
# a nice cat replacement with syntax highlighting
brew install bat
# make a screenshot folder, should make sure it exists XXX
defaults write com.apple.screencapture location /Users/zach/Desktop/screenshots

# aws cli
pip install --user awscli
