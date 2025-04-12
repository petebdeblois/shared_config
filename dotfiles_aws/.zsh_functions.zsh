# Colormap
extract() {

    if [ -f $1 ]; then
        case $1 in
        *.tar.bz2) tar xvjf $1 ;;
        *.tar.gz) tar xvzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) rar x $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xvf $1 ;;
        *.tbz2) tar xvjf $1 ;;
        *.tgz) tar xvzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *) echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"

    fi
}

function hg() {
    history | grep "$1"
}

function find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20
}
# cd() {
#       builtin cd "$@" && ls -lAh
#   }

# ###############################################################3

# https://github.com/rothgar/mastering-zsh/blob/master/docs/helpers/functions.md
function mans() {
    man -k . |
        fzf -n1,2 --preview "echo {} \
    | cut -d' ' -f1 \
    | sed 's# (#.#' \
    | sed 's#)##' \
    | xargs -I% man %" --bind "enter:execute: \
      (echo {} \
      | cut -d' ' -f1 \
      | sed 's# (#.#' \
      | sed 's#)##' \
      | xargs -I% man % \
      | less -R)"
}

function disappointed() {
    echo -n " ಠ_ಠ " | tee /dev/tty | xclip -selection clipboard
}

function flip() {
    echo -n "（╯°□°）╯ ┻━┻" | tee /dev/tty | xclip -selection clipboard
}

function shrug() {
    echo -n "¯\_(ツ)_/¯" | tee /dev/tty | xclip -selection clipboard
}

# ###############################################################3

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    # alias ls='ls -lah --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

fi

# because `master` is sometimes `main` (or others), these must be functions.
function gmb() { # git main branch
    local main
    main=$(git symbolic-ref --short refs/remotes/origin/HEAD)
    main=${main#origin/}
    [[ -n $main ]] || return 1
    echo "$main"
}
# show the diff from inside a branch to the main branch
function gbd() { # git branch diff
    local mb=$(gmb) || return 1
    git diff "$mb..HEAD"
}

# checkout the main branch and update it
function gcmm() { # git checkout $main
    local mb=$(gmb) || return 1
    git checkout "$mb" && git pull
}

# merge the main branch into our branch
function gmm() { # git merge $main
    local mb=$(gmb) || return 1
    git merge "$mb"
}

mcd() {
  local dir="$1"

  mkdir -p "${dir}" &&
    cd "${dir}"
}
