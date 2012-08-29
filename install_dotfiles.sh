cd ~
# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
# install customization
cp ~/.vim/aliases.zsh ~/.oh-my-zsh/lib/aliases.zsh
cp ~/.vim/mik.zsh-theme ~/.oh-my-zsh/themes/mik.zsh-theme
# symlinks
ln -s ~/.vim/vimrc.local ~/.vimrc
ln -s ~/.vim/zshrc.local ~/.zshrc
ln -s ~/.vim/tmux.conf.local ~/.tmux.conf
cd ~/.vim
git submodule update --init
