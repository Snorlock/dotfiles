################################################################################
#Initializing zsh with plugins
################################################################################
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel9k/powerlevel9k"
plugins=(git npm brew osx zsh-syntax-highlighting zsh-autosuggestions)
#https://github.com/zsh-users/zsh-autosuggestions
#https://github.com/zsh-users/zsh-syntax-highlighting
source $ZSH/oh-my-zsh.sh


################################################################################
#Theme powerlevel9k variables and methods
################################################################################
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"

################################################################################
#Setting up my bash history setup
################################################################################

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
autoload -U promptinit; promptinit
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.

################################################################################
#Aliases
################################################################################
alias reload='. ~/.zshrc' #Reload the source
port () {lsof -i :"$1";}
alias f='open -a Finder ./'

################################################################################
#Sourcing and env variables
################################################################################
#z command https://github.com/rupa/z installed by brew
. `brew --prefix`/etc/profile.d/z.sh
source ~/.dotfiles/scripts/nvm.sh
