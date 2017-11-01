// install unity or built in desktop UI
// download the installer from Plex

wget https://downloads.plex.tv/plex-media-server/1.5.5.3634-995f1dead/plexmediaserver_1.5.5.3634-995f1dead_amd64.deb
wget https://downloads.plex.tv/plex-media-server/1.7.5.4035-313f93718/plexmediaserver_1.7.5.4035-313f93718_amd64.deb

// install it
sudo dpkg -i plexmediaserver*.deb

// ensure plex starts from boot
sudo systemctl enable plexmediaserver.service
sudo systemctl start plexmediaserver.service

// check plex status
sudo systemctl status plexmediaserver

// create directory to store plex media
sudo mkdir -p /root/plex/movie

// configure plex - create an SSH tunnel to your Linode. 
// Substitute user with the sudo user on your Linode, and 192.0.2.1 with the IP address of the Plex server:
ssh user@192.0.2.1 -L 8888:localhost:32400

// enter the following into your web browser to performa administration
http://localhost:8888/web

// option 2
// add the plex repo
wget https://downloads.plex.tv/plex-keys/PlexSign.key -O - | sudo apt-key add -
echo "deb https://downloads.plex.tv/repo/deb ./public main" | sudo tee -a /etc/apt/sources.list.d/plex.list
sudo apt update

// install plex
sudo apt install plexmediaserver -y

// See if you can connect at http://ip.address:32400/web or
// http://ip.address:32400/manage/index.html#!/setup

