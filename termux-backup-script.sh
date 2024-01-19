#!/data/data/com.termux/files/usr/bin/bash

set -ex
trap 'termux-notification -c "rclone sync error"' ERR

backup_script=$(dirname $0)/backup.sh
storage=~/storage/shared

remote=gdrive:
local=$storage/gdrive/latest
backups=$storage/gdrive/backups
backup_name=$(date -Iseconds | tr : -)
expiry=30

export RCLONE_PROGRESS=1 # show progress
export RCLONE_FAST_LIST=1 # makes it much faster (more memory but fewer transactions)
export RCLONE_LOCAL_ENCODING="DoubleQuote,Asterisk,Slash,Colon,LtGt,Question,BackSlash,Pipe" # respect android allowed characters for file names otherwise some issues

$backup_script $remote $local $backups $backup_name $expiry
