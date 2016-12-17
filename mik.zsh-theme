# Colors
autoload -U colors
colors
setopt prompt_subst

# Save an indicator to a local variable if the last command exited with success.
local csuccess="%{$reset_color%}%(?,%{$fg[green]%}»%{$reset_color%},%{$fg[red]%}»%{$reset_color%})"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}±%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}✗%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{%F{green}%}✓%{%f%k%b%}"


PROMPT='
%~ $(git_prompt_info) %{$reset_color%}
${csuccess} %{$reset_color%}'
# right prompt
RPROMPT='%{$fg_bold[red]%}($(nodenv version-name)) %{$reset_color%}'
