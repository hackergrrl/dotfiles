#!/usr/bin/env bash

mkdir gpg-backup
gpg -a --export > gpg-backup/pubkeys.asc
gpg -a --export-secret-keys > gpg-backup/privkeys.asc

echo 'written to gpg-backup/ (erase after copying!)'
echo 're-import with "gpg --import foo.asc"'
