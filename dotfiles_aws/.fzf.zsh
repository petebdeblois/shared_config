# Setup fzf
# ---------
if [[ ! "$PATH" == */home/petebdeblois/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/petebdeblois/.fzf/bin"
fi
if [[ ! "$PATH" == */home/ubuntu/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/ubuntu/.fzf/bin"
fi
if [[ ! "$PATH" == */root/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/root/.fzf/bin"
fi

source <(fzf --zsh)
