#!/bin/bash
#
# +--------------------------------------------------------------------------------+
# | Copyright (C) 2013 Kuboosoft                                                   |
# |                                                                                |
# |This program is free software; You can distribute it and / or                   |
# |modify it under the terms of the GNU General Public License                     |
# |as published by the Free Software Foundation; any                               |
# |version 3 of the License, or (optionally) any version                           |
# |later. http://www.gnu.org/licenses/gpl-3.0.html                                 |
# |This program is distributed in the hope that it will be useful,                 |
# |but WITHOUT ANY WARRANTY. See the GNU General Public License                    |
# |for details.                                                                    |
# +--------------------------------------------------------------------------------+
# |This code is designed, written and maintained by David Vasquez                  |
# |This code was translated by Max M                                               |
# |Any questions, comments or advice on this code                                  |
# |should be addressed to:                                                         |
# |https://plus.google.com/communities/118230919321773121406                       |
# +--------------------------------------------------------------------------------+
# FEDORA 19,20 POSTINSTALLER V.1.2.2 64 BITS

hora=$(date +"%H")


if [ $(echo $LANG | cut -b1-2) = "es" ]; then

if test $hora -lt 12; then

yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="Bienvenido a PostInstallerF

Buen dia, PostInstallerF es un programa que instala todo lo necesario en Fedora"


elif test $hora -gt 12 & test $hora -le 18; then

  yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="Bienvenido a PostInstallerF

Buena tarde, PostInstallerF es un programa que instala todo lo necesario en Fedora"

else

	yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="Bienvenido a PostInstallerF

Buena noche, PostInstallerF es un programa que instala todo lo necesario en Fedora"

fi

else

if test $hora -lt 12; then

yad --class="ATENTION" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="

Good day, PostInstallerF is a program that installs everything you need in Fedora"


elif test $hora -gt 12 & test $hora -le 18; then

	yad --class="ATENTION" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="

Good afternoon, PostInstallerF is a program that installs everything you need in Fedora"

else

	yad --class="ATENTION" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="

Good night, PostInstallerF is a program that installs everything you need in Fedora"

fi
 fi


# DIRECTORY AND LOG FILE

if [ -d /usr/share/.postinstallerf/ ]; then
cd /usr/share/.postinstallerf/
echo "el directorio log existe" >> installed.log
else
mkdir -p /usr/share/.postinstallerf/
cd /usr/share/.postinstallerf/
echo "no existia directorio log" >> installed.log 
fi


# KILLING LOCK YUM
pkill -SIGKILL -u root -o yum

# CHECKING REPOSITORIES  

relea=$(rpm -q --queryformat '%{VERSION}\n' fedora-release); echo "relea=$relea"

if [ -f /etc/yum.repos.d/rpmfusion-nonfree.repo ] && [ -f /etc/yum.repos.d/rpmfusion-free.repo ]; then
echo "RPM Fusion free and nonfree repo is present"
else
yum -y localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$relea.noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$relea.noarch.rpm 2>&1 | zenity --progress --title "Checking Repository and Adding RPMFusion" --text="Please wait...." --pulsate --auto-close --width=400
fi


if [ -f /etc/yum.repos.d/russianfedora-free.repo ]; then
echo 'ya esta instalado'
else
yum -y localinstall http://mirror.yandex.ru/fedora/russianfedora/russianfedora/free/fedora/russianfedora-free-release-stable.noarch.rpm 2>&1 | zenity --progress --title "Checking Repository and Adding Community 3rd party Free" --text="Please wait...." --pulsate --auto-close --width=400
fi

if [ -f /etc/yum.repos.d/russianfedora-nonfree.repo ]; then
echo 'ya esta instalado'
else
yum -y localinstall http://mirror.yandex.ru/fedora/russianfedora/russianfedora/nonfree/fedora/russianfedora-nonfree-release-stable.noarch.rpm 2>&1 | zenity --progress --title "Checking Repository and Adding Community 3rd party Free" --text="Please wait...." --pulsate --auto-close --width=400
fi

if [ -f /etc/yum.repos.d/postinstallerf.repo ]; then
echo 'postinstallerf repository is installed'
else
echo '[postinstallerf]
name=PostInstallerF
baseurl=http://sourceforge.net/projects/postinstaller/files/fedora/releases/$releasever/$basearch/
        ftp://heanet.dl.sourceforge.net/mirrors/sourceforge/p/po/postinstaller/fedora/releases/$releasever/$basearch/
        http://ftp.jaist.ac.jp/pub/sourceforge/p/po/postinstaller/fedora/releases/$releasever/$basearch/
        ftp://ftp.mirrorservice.org/sites/download.sourceforge.net/pub/sourceforge/p/po/postinstaller/fedora/releases/releases/$releasever/$basearch/
        http://www.mirrorservice.org/sites/ftp.sourceforge.net/pub/sourceforge/p/po/postinstaller/fedora/releases/$releasever/$basearch/
        http://ftp.pbone.net/mirror/ftp.sourceforge.net/pub/sourceforge/p/po/postinstaller/fedora/releases/$releasever/$basearch/
enable=1
metadata_expire=2d
gpgcheck=0
gpgkey=http://sourceforge.net/projects/postinstaller/files/data/repodata/repomd.xml.key
skip_if_unavailable=1
exclude=ffmpeg ffmpeg-devel ffmpeg-libs


[postinstallerf-source]
name=PostInstallerF-Source
baseurl=http://sourceforge.net/projects/postinstaller/files/SRPM/
        ftp://heanet.dl.sourceforge.net/mirrors/sourceforge/p/po/postinstaller/SRPM/
        http://ftp.jaist.ac.jp/pub/sourceforge/p/po/postinstaller/SRPM/
        ftp://ftp.mirrorservice.org/sites/download.sourceforge.net/pub/sourceforge/p/po/postinstaller/SRPM/
        http://www.mirrorservice.org/sites/ftp.sourceforge.net/pub/sourceforge/p/po/postinstaller/SRPM/
        http://ftp.pbone.net/mirror/ftp.sourceforge.net/pub/sourceforge/p/po/postinstaller/SRPM/
enabled=0
metadata_expire=2d
gpgcheck=0
gpgkey=http://sourceforge.net/projects/postinstaller/files/data/repodata/repomd.xml.key
skip_if_unavailable=1
exclude=ffmpeg ffmpeg-devel ffmpeg-libs' >> /etc/yum.repos.d/postinstallerf.repo
fi
 

wait ${!}


# CLEANING THE REPOSITORY METADATA.

updater=/usr/share/updatepostintaller/Postinstaller64.sh
source=/usr/bin/Postinstaller64.sh
update=/usr/share/updatepostintaller/Postinstaller64.sh

nuday=$(date +%u); echo "nuday=$nuday"

time=$(date +%H); echo "time=$time"
time2=$(date +%R); echo "time2=$time2"

setime=08
setimea=16:00
setimeb=12:00
setimec=0

Mon=1
Tue=2
Wed=3
Thu=4
Fri=5
Sat=6
Sun=7

if [ ""$nuday = $Fri"" ] && [ ""$time = $setime"" ]; then
yum clean metadata
elif [ ""$nuday = $Fri"" ] && [ ""$time2 = $setimea"" ]; then
yum clean metadata
elif [ ""$nuday = $Fri"" ] && [ ""$time2 = $setimeb"" ]; then
yum clean metadata
elif [ ""$nuday = $Fri"" ] && [ ""$time = $setimec"" ]; then
yum clean metadata
fi

# LOOKING FOR NEW UPDATES AND INSTALLING POSTINSTALLERF MAIN MENU


if [ ""$nuday = $Tue"" ]; then
if [ -f $updater ]; then
rm -f /usr/share/updatepostintaller/Postinstaller64.sh
echo "Obselete file was removed, Updating file"
else
echo "Up to date did not update the file"
fi

if [ -d /usr/share/updatepostintaller/ ]; then
xterm -e 'wget -c -P/usr/share/updatepostintaller/ https://raw.github.com/kuboosoft/postinstallerf/master/Postinstaller64.sh'
else
mkdir /usr/share/updatepostintaller/
 wget -c -P/usr/share/updatepostintaller/ https://raw.github.com/kuboosoft/postinstallerf/master/Postinstaller64.sh 2>&1 |sed -un 's_^.* \([0-9]\+%\).* \([0-9.]\+[GMKB]\).*_#Downloading:Updates  [\1]Speed:.........[\2B]_p' |zenity --progress --pulsate --auto-close --width 500
fi 

diff -a $source $update
if [ $? -eq 0 ]; then
echo "The files are equal"
if [ $(echo $LANG | cut -b1-2) = "es" ]; then
yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="PostInstallerF se encuentra actualizado" --timeout=5
else
yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="PostInstallerF is updated" --timeout=5
fi
 else
echo "The files are not equal"
cp -f /usr/share/updatepostintaller/Postinstaller64.sh /usr/bin/ 
if [ $(echo $LANG | cut -b1-2) = "es" ]; then
yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="PostInstallerF se ha actualizado 

 Por favor Reinicie PostInstallerF"
else
yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="PostInstallerF was updated 

 Please Restart PostInstallerF" 
fi
 fi

elif [ ""$nuday = $Thu"" ]; then

if [ -f $updater ]; then
rm -f /usr/share/updatepostintaller/Postinstaller64.sh
echo "Obselete file was removed, Updating file"
else
echo "Up to date did not update the file"
fi

if [ -d /usr/share/updatepostintaller/ ]; then
xterm -e 'wget -c -P/usr/share/updatepostintaller/ https://raw.github.com/kuboosoft/postinstallerf/master/Postinstaller64.sh' 
else
mkdir /usr/share/updatepostintaller/
 wget -c -P/usr/share/updatepostintaller/ https://raw.github.com/kuboosoft/postinstallerf/master/Postinstaller64.sh 2>&1 |sed -un 's_^.* \([0-9]\+%\).* \([0-9.]\+[GMKB]\).*_#Downloading:Updates  [\1]Speed:.........[\2B]_p' |zenity --progress --pulsate --auto-close --width 500
fi 


diff -a $source $update
if [ $? -eq 0 ]; then
echo "The files are equal"
if [ $(echo $LANG | cut -b1-2) = "es" ]; then
yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="PostInstallerF se encuentra actualizado" --timeout=5
else
yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="PostInstallerF is updated" --timeout=5
fi
 else
echo "The files are not equal"
cp -f /usr/share/updatepostintaller/Postinstaller64.sh /usr/bin/ 
if [ $(echo $LANG | cut -b1-2) = "es" ]; then
yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="PostInstallerF se ha actualizado 

 Por favor Reinicie PostInstallerF"
else
yad --class="ATENCIÓN" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/acciones/topicon.png" --image-on-top --info --title="PostInstallerF" --text="PostInstallerF was updated 

 Please Restart PostInstallerF" 
fi
 fi
fi




# UPDATING THE SYSTEM

if [ ! -f /usr/bin/postinstallerf/update_system ]; then
xterm -e 'wget -c -P/usr/bin/postinstallerf/ https://raw.github.com/kuboosoft/postinstallerf/master/update_system'
chmod a+x /usr/bin/postinstallerf/update_system
fi

if [ ! -f /usr/share/icons/logview.png ]; then
wget -c -P/usr/share/icons/ http://sourceforge.net/projects/postinstaller/files/icons/logview.png
fi

log=$(cat -T /var/log/yum.log | grep -e "`date "+%b %d"`" )

check_up= yum -e0 -d0 check-update > /tmp/yum.results.XXXXXX

updatenow=/usr/bin/postinstallerf/update_system

check=3

# If there are updates available, Ask to user if want update 

if [ -s $WORK ]; then  

find /var/log/ -name yum.log -ctime +$check -exec $updatenow {} \;
wait ${!}
yad --title="Log viewer updates" --window-icon="/usr/share/icons/acciones/topicon.png" --image="/usr/share/icons/logview.png" --image-on-top --list --width="435" --height="300" --text="Content of yum updates" --column=Month --column=Date --column=Time --column=Status --column=Package $log --button="Close:1"

cat /dev/null > /tmp/yum.results.XXXXXX
 else
echo 'no updates'
fi
 

# CHECKING SUBMENUS OF POSTINSTALLERF

if [ -f /usr/bin/postinstaller ]; then
echo "PostinstallerF esta presente"
else
xterm -e 'wget -c -P/usr/bin/ https://raw.github.com/kuboosoft/postinstallerf/master/postinstaller'
chmod a+x /usr/bin/postinstaller
fi

if [ -f /usr/bin/postinstallerf/addpost64.sh ]; then
echo "addpost esta presente"
else
xterm -e 'wget -c -P/usr/bin/postinstallerf/ https://raw.github.com/kuboosoft/postinstallerf/master/addpost64.sh'
chmod a+x /usr/bin/postinstallerf/addpost64.sh
fi


if [ -f /usr/bin/postinstallerf/confpost64.sh ]; then
echo "confpost esta presente"
else
xterm -e 'wget -c -P/usr/bin/postinstallerf/ https://raw.github.com/kuboosoft/postinstallerf/master/confpost64.sh'
chmod a+x /usr/bin/postinstallerf/confpost64.sh
fi


if [ -f /usr/bin/postinstallerf/gnext.sh ]; then
echo "gnext esta presente"
else
xterm -e 'wget -c -P/usr/bin/postinstallerf/ https://raw.github.com/kuboosoft/postinstallerf/master/gnext.sh'
chmod a+x /usr/bin/postinstallerf/gnext.sh
fi


if [ -f /usr/bin/postinstallerf/Logout.sh ]; then
echo "Logout esta presente"
else
xterm -e 'wget -c -P/usr/bin/postinstallerf/ https://raw.github.com/kuboosoft/postinstallerf/master/Logout.sh'
chmod a+x /usr/bin/postinstallerf/Logout.sh
fi


# TESTING THE SOUND IN POSTINSTALLERF.
sound=/usr/bin/postinstallerf/sound21.ogg
if [ -f $sound ]; then
echo "sound esta presente"
else
wget -c -P/usr/bin/postinstallerf/ http://sourceforge.net/projects/postinstaller/files/data/sound21.ogg
fi


clear

# +--------------------------------------------------------------------------------------------------+
# |HERE BEGINS THE MENU                                                                              |
# +--------------------------------------------------------------------------------------------------+




P_RUN=$(yad --image="/usr/share/icons/acciones/topicon.png" --image-on-top --icons --class="PostInstallerF" --name="PostInstallerF" --window-icon="/usr/share/icons/Postinstaller1.svg" --item-width="110" --read-dir="/usr/share/Postdesktopfiles64" --width="435" --height="435" --title="PostInstallerF" --auto-kill --text="\n<b>Double click</b> an item to select an action:" --button="Website:0" --button="Close:1")

if [ $? -eq 0 ]; then
	su $noti3 -c '/usr/bin/firefox http://sourceforge.net/projects/postinstaller/' &
else
	echo "nada que hacer"
	fi
	exit 0


#initialising notification
    noti=$(who -u | awk '{print $1}'); echo "noti = $noti"
    noti3=$(loginctl show-session $XDG_SESSION_ID | cut -d= -f2 | tail -n 1); echo "noti3 = $noti3"

    #initialising change directory default log
    changelog="cd /usr/share/.postinstallerf/"


# its others alternative similar initialising other users or notification 
# noti=$(who am i | awk '{print $1}'); echo "noti = $noti"
# username=$(zenity --entry --text="Username"); echo "username = $username"
