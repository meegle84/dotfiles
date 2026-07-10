# macOS-specific aliases loaded from ~/.aliases.

alias mountReadWrite='/sbin/mount -uw /' # For use when booted into single-user
alias removeDS="find . -name '.DS_Store' -depth -exec rm -f {} \;"
alias removeDT="find . -name '._Trashes' -depth -exec rm -f {} \;"
alias removeDD="find . -name '._*' -depth -exec rm -f {} \;"
alias removeDAll="removeDT && removeDD && removeDS"
alias cleanLaunchServices="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
alias showDots="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hideDots="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias showDesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hideDesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias sleepDisable="sudo pmset -b sleep 0; sudo pmset -b disablesleep 1"
alias sleepEnable="sudo pmset -b sleep 5; sudo pmset -b disablesleep 0"
