# bitbucket-backup
Backup all your Bitbucket Repositories with this Shell Script. No extra packages needed.

# How to Use
- Download the latest release from github to the backup server.
- Open the file bitbucket-backup.sh and add the below variables.

    bbuser='Username_here'  Bitbucket Username
    bbpass='password_here' # You can use your password, Or you can generate *app Passowrd* from the account settings
    
      Go to https://bitbucket.org/account/user/username/app-passwords , click *Generate App Password*
      Give *Read* Permissions to Account, Team , Projects, Repositories
#Backup Location
backloc="/backups/bitbucket" #backup location on this system




This shell script will do a bare-clone on your all repositries. Backup will be stored on the backloc location specified on the script.
