# rclone-local-backup
Backup your cloud data to your local devices using rclone.

The backup strategy follows a "trash can" approach. When a file is deleted or modified (in the cloud), it is moved to a backup folder. Backups are removed when they expire after a set period of time.

## Synchronisation Process
### 1. rclone sync
```
rclone sync $remote $local --backup-dir $backups/$backup_name
```
1. Backup out-of-sync files
2. Sync local to remote
### 2. Delete old backups
```
find $backups -depth 1 -mtime $expiry -exec rm -r {} +
```
It works by comparing the modification time of the backup folder.

## Example
Setup your remote using `rclone config`.
```
rclone sync gdrive: ~/gdrive/latest --backup-dir ~/gdrive/backups/$(date -Iseconds | tr : -)
find ~/gdrive/backups -depth 1 -mtime +30 -exec rm -r {} +
```

## Setup
### Termux
#### 1. Termux & Termux-API
#### 2. Termux packages
1. rclone: `pkg install rclone`
2. termux-api: `pkg install termux-api`
#### 3. Schedule backups
