# export ZSH="$HOME/.oh-my-zsh"
export PIP_BREAK_SYSTEM_PACKAGES=1
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
# don't overwrite GNU Midnight Commander's setting of 'ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
# export PATH="/home/ubuntu/.local/bin:$PATH"
# export PATH="/root/.local/bin:$PATH"
if [ -d "${HOME}/bin" ]; then
  export PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/.local/bin" ]; then
  export PATH="${HOME}/.local/bin:${PATH}"
fi
# SOPS
export SOPS_AGE_KEY_FILE=$HOME/.sops/age.agekey
