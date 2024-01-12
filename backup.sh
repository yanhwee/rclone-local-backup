set -ex

remote=$1
local=$2
backups=$3
backup_name=$4
expiry=$5

mkdir -p $local $backups/$backup_name # prevent error on `find` and logging purposes
rclone sync $remote $local --backup-dir $backups/$backup_name
find $backups -mindepth 1 -maxdepth 1 -mtime +$expiry -exec rm -r {} +