# Only run these is NO_RCS is not set
if [[ ! -o norcs ]]; then
  export EDITOR=nvim
  export VISUAL=nvim
  export SSH_KEY_PATH="~/.ssh/rsa_id"

  typeset -U path
fi
