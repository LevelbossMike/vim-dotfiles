cd ~
# cleanup
rm -rf ~/.vim/zgen ~/.vim/bundle

# install zgen
git clone git@github.com:tarjoilija/zgen.git ~/.vim/zgen

# link rc files
ln -sf ~/.vim/vimrc.local ~/.vimrc
ln -sf ~/.vim/zshrc.local ~/.zshrc
ln -sf ~/.vim/tmux.conf.local ~/.tmux.conf
ln -sf ~/.vim/ackrc.local ~/.ackrc
ln -sf ~/.vim/gitconfig.local ~/.gitconfig

# make vi mode work in terminal
cp ~/.vim/inputrc.local ~/.inputrc

# make vi mode work in irb/pry/rails_console
cp ~/.vim/editrc.local ~/.editrc

# install vundle for managing vim-plugins
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# to install vundle bundles
vim +BundleInstall +qall

# change shell to zsh
chsh -s $(which zsh)
