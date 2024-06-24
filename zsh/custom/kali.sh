#!/bin/bash

# Variables for SSH connection
REMOTE_USER="main"
REMOTE_HOST="10.0.0.100"

# sqlmap
sqlmap_remote() {
    local sqlmap_cmd="sqlmap $@"
    ssh "$REMOTE_USER"@"$REMOTE_HOST" "$sqlmap_cmd"
}
alias sqlmap=sqlmap_remote

# xsser
xsser_remote() {
    local xsser_cmd="xsser $@"
    ssh "$REMOTE_USER"@"$REMOTE_HOST" "$xsser_cmd"
}
alias xsser=xsser_remote
