cd ~
# cleanup
rm -rf ~/.oh-my-zsh ~/.vim/bundle
# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
# install customization
cp ~/.vim/aliases.zsh ~/.oh-my-zsh/custom
mkdir ~/.oh-my-zsh/custom/themes && cp ~/.vim/mik.zsh-theme ~/.oh-my-zsh/custom/themes
cp ~/.vim/vimrc.local ~/.vimrc
cp ~/.vim/zshrc.local ~/.zshrc
cp ~/.vim/tmux.conf.local ~/.tmux.conf
cp ~/.vim/ackrc.local ~/.ackrc
# make vi mode work in terminal
cp ~/.vim/inputrc.local ~/.inputrc
# make vi mode work in irb/pry/rails_console
cp ~/.vim/editrc.local ~/.editrc
# to install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# to install bundles
vim +BundleInstall +qall
