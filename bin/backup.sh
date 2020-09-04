#!/bin/sh
NAME=core_backup
tar -cvzf $NAME.tar.gz ~/.ssh/ ~/.borg_backup_key
gpg -c $NAME.tar.gz
rm $NAME.tar.gz
scp $NAME.tar.gz.gpg angel:~/backups/`date -I`-$NAME.tar.gz.gpg
