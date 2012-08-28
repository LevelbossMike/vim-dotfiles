cd ~
ln -s ~/.vim/vimrc.local ~/.vimrc
ln -s ~/.vim/tmux.conf.local ~/.tmux.conf
cd ~/.vim
git submodule update --init
