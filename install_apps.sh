#! /usr/bin/env bash

# Installs Homebrew software.

if ! command -v brew > /dev/null; then
  ruby -e "$(curl --location --fail --show-error https://raw.githubusercontent.com/homebrew/install/master/install)"
  export path="/usr/local/bin:$path"
  printf "export path=\"/usr/local/bin:$path\"\n" >> $home/.bash_profile
fi

printf "Updating brew\n"
brew upgrade && brew update

printf "Installing xcode cli utils\n"
xcode-select --install

printf "brew: tap cask-fonts\n"
brew tap homebrew/cask-fonts

printf "brew: installing fonts\n"
brew cask install font-fira-code

printf "brew: Installing cli packages\n"
brew install git            # To use up-to-date git
brew install zsh            # to use up-to-date zsh
brew install mas            # Apple store cli
brew install asdf           # version manager
brew install neovim --HEAD  # teh best editor
brew install tmux           # multiplex terminal
brew install gnupg          # to verify packages from asdf
brew install z              # track most-used directories
brew install ripgrep        # for searching

printf "brew: Installing apps\n"
brew cask install 1password
brew cask install dropbox
brew cask install docker
brew cask install google-chrome
brew cask install iterm2
brew cask install slack
brew cask install spotify
brew cask install obsidian
brew cask install twist
brew cask install signal
brew cask install moom
brew cask install discord
brew cask install launchbar
# brew cask install little-snitch - little snitch needs to be installed manually
brew cask install spark              # create hotkeys
brew cask install karabiner-elements # customize keys

# Installs App Store software - find IDs by running `mas search`
if ! command -v mas > /dev/null; then
  printf "ERROR: Mac App Store CLI (mas) can't be found.\n"
  printf "       Please ensure Homebrew and mas (i.e. brew install mas) have been installed first."
  exit 1
fi

printf "AppStore: Installing Todoist\n"
mas install 585829637

printf "AppStore: Installing Microsoft OneNote\n"
mas install 784801555

printf "AppStore: Installing PLIST Editor\n"
mas install 1157491961

printf "AppStore: Installing Kindle App\n"
mas install 405399194

printf "AppStore: Installing Gifski\n"
mas install 1351639930
