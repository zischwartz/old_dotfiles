
# Disable annoying warning 
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# A lot of my bash_profile will break if dependencies aren't installed
# Plus, why not install stuff automatically on a new machine

# Referenced in bash_profile
# dvm, docker version manager
curl -sL https://download.getcarina.com/dvm/latest/install.sh | sh

# curl -sL https://github.com/downloads/whomwah/qlstephen/QLStephen.qlgenerator.zip
# mkdir ~/Library/QuickLook
# cp 