# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

#reload .zshrc
alias rld='source ~/.zshrc'

# edit oh_my_zsh
alias ozsh='mvim ~/.oh-my-zsh/'
alias zshrc='mvim ~/.zshrc'

# work
alias runtastic='cd ~/development/runtastic/runtastic-web/'
alias restore='cd ~/development/runtastic/restore/'

# mvim 
alias m="mvim"

# redis
alias redis="redis-server /usr/local/etc/redis.conf"

# tmux 
alias t="tmux -u" # run with utf-8 enabled!
alias tl="tmux ls"
alias ta="tmux attach -t"

# git
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
