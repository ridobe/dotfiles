#Automated .sh file for rsync backups to external HD.
#!/bin/bash
sudo rsync -aAX --info=progress2 --delete --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found","/home/ridobe/.thumbnails/*","/home/ridobe/.cache/google-chrome","/home/ridobe/.local/share/Trash/*"} /* /run/media/ridobe/Seagate\ Backup\ Plus\ Drive/Linux_archive/Desktop/desktop_rsync_backup/