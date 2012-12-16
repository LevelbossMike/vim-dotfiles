These dotfiles use [Vundle](https://github.com/gmarik/vundle) for managing
vim-plugins. To only install plugins enter the following command into your console.

```shell
# to install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# to install bundles
vim +BundleInstall +qall
```

If you want to install the whole dotfiles you can use the install_dotfiles
script:

```shell
bash install_dotfiles.sh
```
