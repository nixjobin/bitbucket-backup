# Bitbucket Backup
Backup all your Bitbucket Repositories with this Shell Script. No extra packages needed.


## Features
- This shell script will do a bare-clone on your all repositries. 
- Backup will be stored on the backloc location specified on the script.
- You can add a cron on the server for desired interval.
- We recommemnd Generating App Password which will have only read access to your account


## How to Configure
- Download the latest release from github to the backup server.
<pre>cd /usr/local/src && wget https://raw.githubusercontent.com/redhatjobin/bitbucket-backup/master/bitbucket-backup.sh</pre>
- Open the file bitbucket-backup.sh and add the below variables.

    <pre>bbuser='Username_here' #Bitbucket USERNAME from https://bitbucket.org/USERNAME/reponame. Email id will not work as username.
    bbpass='password_here'      # Password or App Password
    backloc="/backups/bitbucket" #backup location on this system
    </pre>

## How to Create an App Password
- Go to https://bitbucket.org/account/user/USERNAME/app-passwords , click *Generate App Password*
- Give *Read* Permissions to Account, Team , Projects, Repositories


## How to add cron

- You can run <code>crontab -e</code> command to edit the contab. You can add the cron under any user.
- The below cron sample will run the backup at 3 AM every day.
<pre> 0 3 * * * /usr/local/src/bitbucket-backup.sh</pre>
