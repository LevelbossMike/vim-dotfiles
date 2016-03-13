If you want to install the whole dotfiles you can use the install_dotfiles
script:

```shell
bash install_dotfiles.sh
```

# Tools

## neovim
Gives you terminal integration (`:terminal`), async linting and truecolor
support.

```
brew tap neovim/neovim
brew install --HEAD neovim
```

To get jshint linting to work just install jshint before editing js-files:

```
npm install -g jshint
```

## tmux
Right now you have to use HEAD because truecolor support will only be
in tmux with the next version 2.2. 2.1 is the stable version as of writing
this and does not support true colors.

```
brew uninstall tmux
brew install tmux --HEAD
```

##iterm2

Just to get truecolor support as the 10.11 terminal does not support
truecolors.


# Theme

These dotfiles assume you want to use [Oceanic-next](https://github.com/mhartington/oceanic-next)
as your theme in vim as well as the [iterm version](https://github.com/mhartington/oceanic-next-iterm).
