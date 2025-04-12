# Reference : https://www.youtube.com/watch?v=ud7YxC33Z3w

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# ~/miniconda3/bin/conda init zsh

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"



# Add in Powerlevel10k
zinit ice depth=1

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# Add in snippets
zinit snippet OMZP::alias-finder

zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default


zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::web-search
zinit snippet OMZP::vscode
zinit snippet OMZP::ubuntu
zinit snippet OMZP::ssh
zinit snippet OMZP::docker-compose
zinit snippet OMZP::terraform

plugins=(
    alias-finder
    git
    terraform
    sudo
    command-not-found
    web-search
    vscode
    ssh
    docker-compose
    
)

# Load completions -> Goes with zinit light zsh-users/zsh-autosuggestions

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
zinit cdreplay -q

source <(kubectl completion zsh)
. <(flux completion zsh)
#
# Init oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.omp.default.json)"
# eval "$(oh-my-posh init zsh --config ~/.omp.gruvbox.json)"
# https://direnv.net/docs/hook.html
# curl -sfL https://direnv.net/install.sh | bash
eval "$(direnv hook zsh)"

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# https://developer.1password.com/docs/cli/app-integration#optional-set-the-biometric-unlock-environment-variable
export OP_BIOMETRIC_UNLOCK_ENABLED=true


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

###########
# Aliases #
###########
[[ -f ~/.zsh_aliases.zsh ]] && source ~/.zsh_aliases.zsh
[[ -f ~/.zsh_functions.zsh ]] && source ~/.zsh_functions.zsh

# You can use whatever you want as an alias, like for Mondays:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion



