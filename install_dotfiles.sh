cd ~
mkdir -p ~/.tmux/plugins/tpm
# cleanup
rm -rf ~/.vim/zgen ~/.vim/bundle ~/.tmux/plugins/tpm

# install zgen
git clone https://github.com/tarjoilija/zgen.git ~/.vim/zgen

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

# install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# nvim configuration
ln -sf ~/.vim/nvim_init.vim ~/.config/nvim/init.vim

# alacritty configuration
mkdir -p ~/.config/alacritty
ln -sf ~/.vim/alacritty.yml ~/.config/alacritty/alacritty.yml
