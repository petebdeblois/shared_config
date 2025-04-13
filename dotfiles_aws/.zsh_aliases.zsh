# Applications
alias cal="cal -m -3"
# alias git="nice git"
# alias gsh="git stash"
# alias gfo="git fetch origin"
# alias gst="git status --short --branch"
# alias gsu="git submodule update --recursive --merge"
# alias gdf="git diff"
# alias gdt="git difftool"
# alias glo="git log"
# alias gps="git push"
# alias gpl="git pull"
# alias gco="git checkout"
# alias gci="git commit"
# alias gcz="git cz"
# alias gcr="git commit -m '$(curl -s https://whatthecommit.com/index.txt)'"
# alias gad="git add ."
# alias gaa="git add -A"
# alias grm="git rm"
# alias gmv="git mv"
# alias gtg="git tag"
# alias gbr="git branch"
# alias gs="git svn"
alias python="python3"


alias h="history"
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"
alias hgrep='history | grep'

# Makes file commands verbose.
alias cp='cp -v'
alias mv='mv -v'
# Displays drives and space in human readable format.
alias df='df -h'

# Network
alias n="netstat -np tcp"
alias mtr="mtr -t"
alias nmap="nmap -v -v -T5"
alias nmapp="nmap -P0 -A --osscan_limit"
alias pktstat="sudo pktstat -tBFT"

alias nvmetemp='sudo nvme smart-log /dev/nvme0 | grep -i "^temperature"'

# Eza
alias ls="eza --icons --group-directories-first -la"
alias ll="eza --icons --group-directories-first -l"
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias lse="eza --icons --group-directories-first -la"
alias lle="eza --icons --group-directories-first -l"
alias le="eza -l --icons --git -a"
alias lte="eza --tree --level=2 --long --icons --git"

# Dir
alias home='cd'
alias documents='cd ~/documents'
alias downloads='cd ~/downloads'
alias music='cd ~/music'
alias pix='cd ~/pictures'
alias root='sudo -i'
alias ..='echo "cd .."; cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

# Sudo
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get remove --purge'
alias update='sudo apt-get update'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias sources='(gksudo geany /etc/apt/sources.list &)'
alias upgrade='sudo apt update && sudo apt upgrade && sudo apt-get autoclean && sudo apt-get autoremove'
alias benchmark='sysbench --threads=$(nproc) cpu run'
alias cpu='cat /proc/cpuinfo  | grep 'name'| uniq'
alias listfiles='ncdu'

# chmod and permissions commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'

# Misc
alias a='alias'
alias ok='clear'
alias h='htop'
alias font='fc-cache -v -f'
alias up='docker compose up -'




# https://bitspeicher.blog/how-to-be-a-good-commitizen/
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --decorate --date=short --color | devmoji | head -n 20'

# Programs
alias vi='nvim'
alias vim='nvim'
# Reload zshrc file to apply changes.
# Allows you to not need to restart terminal for changes to .zshrc to be applied
alias reload='source ~/.zshrc'

# https://github.com/jesseduffield/lazydocker
alias lzd='~/.local/bin/lazydocker'

alias deletebranches='git branch | grep -v “main” | xargs git branch -D'
