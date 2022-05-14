cmd_exists go && {
  export GOPATH=$(go env GOPATH)
  path=($path ~/go/bin)
}
