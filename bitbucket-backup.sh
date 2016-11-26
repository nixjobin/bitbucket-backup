#!/bin/bash
#Author Jobin Joseph
#Blog : AWSadminz.com
#Bio  : JobinJoseph.com


#Bitbucket credentials
bbuser='Username_here' # Bitbucket Username
bbpass='password_here' # Generate APP password if you dont want to disclose the Password here
#Backup Location
backloc="/backups/bitbucket" #backup location on this system

#
fname=`date +%F_%H_%M`

cd $backloc

bitbucket_get_urls () {
rm -f bitbucketurls
curl --user $bbuser:$bbpass https://bitbucket.org/api/1.0/user/repositories > bitbucket.1
tr , '\n' < bitbucket.1 > bitbucket.2
tr -d '"{}[]' < bitbucket.2 > bitbucket.3

#Processing
cat bitbucket.3 |grep -i uri |cut -d":" -f2 >bitbucket.4
sed 's/\/1\.0\/repositories\///g' bitbucket.4 > bitbucket.5
cat bitbucket.5 |grep $bbuser > bitbucket.6

#make it a gir utl
for i in `cat bitbucket.6` ;do
echo "git@bitbucket.org:$i.git" >> bitbucketurls
rm -f bitbucket.*
done
}

bb_backup () {
rm -rf `cat VERSION`
echo $fname > VERSION
mkdir $fname
cd $fname

#bare clone
for repo in `cat ../bitbucketurls` ; do
echo "========== Cloning $repo =========="
git clone --bare $repo
done
}

#Backup Starts here

bitbucket_get_urls
bb_backup

exit 0
