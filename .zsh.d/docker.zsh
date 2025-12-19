cmd_exists docker
if [[ $? ]]; then
  alias dcu="docker compose up -d"
  alias dcd="docker compose down"
fi
