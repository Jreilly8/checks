#!/bin/bash
# Navigate to backups, list dates of directories, list slected files, and output to /share/MD0_DATA/server_backups/checks.
# For faster human checking of current backups. - 12/17/2013

# refactored 02/03/2014

MAIN=/path/to/backups/server_backups
CHECKS=/path/to/backups/checks
TIMFS=filesystem
TIMSQL=mysql

# Step 1 list filesystem backup folders (make sure the dates are correct)
# Step 2 list contents of a folder in latest filesystem backup (make sure content exists)
# Step 3 list mysql backup folders (make sure date is correct)
# Step 4 list contents of latest mysql backup (make sure backups exist)

ls $MAIN/fermat.$TIMFS/ > $CHECKS/check_files_dir_list.txt
ls $MAIN/fermat.$TIMFS/current/var/www/sites/path/htdocs/ > $CHECKS/check_files_list.txt
ls $MAIN/fermat.$TIMSQL/ > $CHECKS/check_mysql_dir_list.txt
ls "$(\ls -1dt ${MAIN}/backup.${TIMSQL}/* | head -n 1)" > $CHECKS/check_mysql_list.txt
