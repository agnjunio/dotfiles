# Set Oh My Zsh theme conditionally
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  ZSH_THEME=""  # Disable Powerlevel10k for Cursor
fi

# Use a minimal prompt in Cursor to avoid command detection issues
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  PROMPT='%n@%m:%~%# '
  RPROMPT=''
fi
