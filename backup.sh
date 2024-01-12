set -e
set -x

src=$1
dest=$2
backups=$3
backup_name=$4
expiry=$5

rclone sync $src $dest --backup-dir $backups/$backup_name
find $backups -depth 1 -mtime $expiry -exec rm -r {} +