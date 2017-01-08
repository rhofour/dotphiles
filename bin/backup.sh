#!/bin/sh
tar -cvzf ssh.tar.gz ~/.ssh/ && gpg -c ssh.tar.gz && scp ssh.tar.gz angel:~/backups/`date -I`-ssh.tar.gz.gpg
rm ssh.tar.gz
rm ssh.tar.gz.gpg
