#!/bin/bash

me=`whoami`

sudo apt-get -y install 7z       #zip
sudo apt-get -y install unzip    #unzip
sudo apt-get -y install zip   #zip
#sudo apt-get -y install diodon   # clipboard  moved down
sudo apt-get -y install git
sudo apt-get -y install redshift # flux for linux
sudo apt-get -y install xclip    # allows pipe to xclip
sudo apt-get -y install gcp      # copy with progress
sudo apt-get -y install zsh      # copy with progress
#sudo apt-get -y install vim
sudo apt-get -y install powerline
sudo apt-get -y install arp-scan #hacking tools
sudo apt-get -y install mpv      #video player
sudo apt-get -y install tmux
sudo apt-get -y install pidgin # chat
sudo apt-get -y install ack-grep
sudo apt-get -y install python3-pip
sudo apt-get -y install ipython3
sudo apt-get -y install shutter #screenshot manager + easy share / upload
sudo apt-get -y install most #color man pages
sudo apt-get -y install qbittorrent
sudo apt-get -y install imagemagick
sudo apt-get -y install gparted
sudo apt-get -y install tuptime #control time, reboot ...
sudo apt-get -y install tig # easy git log
sudo apt-get -y install build-essentials # easy git log

#neofetch - show system status
sudo add-apt-repository ppa:dawidd0811/neofetch
sudo apt-get update
sudo apt-get -y install neofetch

#clipboard manager
sudo apt-get -y install glipper

#git
mkdir ~/git
git config --global user.name "dcrystalj"
git config --global user.email "dcrystalj@gmail.com"
git config --global push.default simple

####DOCKER
sudo usermod -aG docker `whoami`

#oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


#remove ubuntu unnecessary lenses
sudo apt-get purge unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-colourlovers unity-scope-devhelp unity-scope-firefoxbookmarks unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-manpages unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-yelp unity-scope-zotero unity-lens-music unity-lens-photos unity-lens-video


#bing wallpaper
cd ~/git && git clone https://github.com/dcrystalj/bing-wallpaper.git --depth 1
./install.sh


#powerline fonts
#mkdir ~/git && cd ~/git && git clone https://github.com/powerline/fonts --depth 1
#~/git/fonts/install.sh



#spf13
sudo apt-get install curl
curl http://j.mp/spf13-vim3 -L -o - | sh
echo "let g:airline_powerline_fonts=1" >> ~/.vimrc.before.local
cd ~/git && git clone https://github.com/vim-airline/vim-airline-themes --depth 1
cp -r ~/git/vim-airline-themes/* ~/.vim
echo "let g:airline_theme='dark'" >> ~/.vimrc.local
cp .vimrc.bundles.local ~/
cp .vimrc.local ~/
vim -c ':PluginInstall'


#chromium
cd ~/git && git clone https://github.com/scheib/chromium-latest-linux --depth 1
~/git/chromium-latest-linux/update-and-run.sh

#sublime
cd ~/Downloads
wget https://download.sublimetext.com/sublime-text_build-3103_amd64.deb
sudo dpkg -i sublime-text_build-3103_amd64.deb

#skype
wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb

#atom
wget https://atom.io/download/deb
sudo dpkg -i deb
sudo apt-get install -f
cp .atom/config.cson ~/.atom

#nylas mail
wget https://edgehill.nylas.com/download?platform=linux-deb
sudo dpkg -i 'download?platform=linux-deb'
sudo apt-get install -f
cp .nylas/config.cson ~/.nylas/


#youtube player
cd ~/git && git clone https://github.com/agiz/youtube-mpv --depth 1
~/git/youtube-mpv/install-ubuntu.sh


#pidgin plugins

	#skype
	 sudo apt-get install libpurple-dev libjson-glib-dev cmake gcc
    cd ~/git && git clone git://github.com/EionRobb/skype4pidgin.git --depth 1
    cd skype4pidgin/skypeweb
    mkdir build
    cd build
    cmake ..
    cpack
    sudo dpkg -i skypeweb-1.1.0-Linux.deb

	#facebook
	sudo echo "deb http://download.opensuse.org/repositories/home:/dequis/xUbuntu_15.10 ./" | sudo tee -a /etc/apt/sources.list.d/dequis.list
	sudo apt-get update
	sudo apt-get install -y purple-facebook


#change capslock to ctrl
sudo echo "@reboot setxkbmap -layout us -option ctrl:nocaps" | sudo tee -a /var/spool/cron/crontabs/root
sudo echo "0 * * * * setxkbmap -layout us -option ctrl:nocaps" | sudo tee -a /var/spool/cron/crontabs/root


#sensors
sudo apt-get install -y lm-sensors
yes | sudo sensors-detect
yes | sudo service kmod start


#gimp
sudo apt-get install gimp
#gimp THEME
cd ~/git/
git clone https://github.com/doctormo/GimpPs
cp -r GimpPs/* ~/.gimp-2.8

#vim with LUA
sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common

sudo apt-get build-dep vim-gnome

sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

sudo rm -rf /usr/local/share/vim

sudo rm /usr/bin/vim

sudo mkdir /usr/include/lua5.1/include
sudo mv /usr/include/lua5.1/*.h /usr/include/lua5.1/include/

sudo ln -s /usr/bin/luajit-2.0.0-beta9 /usr/bin/luajit

cd ~/git
git clone https://github.com/vim/vim --depth 1
cd vim/src
make distclean
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-largefile \
            --disable-netbeans \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
	    --enable-gui=auto \
            --enable-fail-if-missing \
            --with-lua-prefix=/usr/include/lua5.1 \
            --enable-cscope
make
sudo make install

sudo ln -s /usr/local/bin/vim /usr/local/bin/vi
sudo ln -s /usr/local/bin/vim /usr/bin/vi
sudo ln -s /usr/local/bin/vim /usr/bin/vim

#destroy nano
cd /bin
sudo mv nano nano_must_die
sudo ln -s /usr/bin/vim nano
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1

#FILE EXPLORER
sudo apt-get install nemo-compare nemo-dropbox nemo-media-columns nemo-pastebin nemo-seahorse nemo-share nemo-emblems nemo-image-converter nemo-audio-tab
sudo apt-get install nemo-terminal
#preview
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install gloobus-preview
sudo apt-get install unoconv gnumeric
sudo apt-get install nemo-gloobus-sushi
nemo -q
#install nemo file manager instead of nautilus
sudo add-apt-repository ppa:webupd8team/nemo
sudo apt-get update
sudo apt-get install nemo nemo-fileroller

#desktop nemo
gsettings set org.gnome.desktop.background show-desktop-icons false
#default nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

#fix search in nautilus
gsettings set org.gnome.nautilus.preferences enable-interactive-search false


#all configs
cp -r .config ~/
cp -r .ssh ~/
cp -r .purple ~/
cp -r .tmux.conf ~/
cp -r .zshrc ~/


#move luncher to bottom
#sudo gsettings set com.canonical.Unity.Launcher launcher-position Bottom

#disable non-usefull services
sudo systemctl disable bluetooth.service

#fix touchpad on lenovo yoga 2 pro
sudo cp 50-synaptics.conf /usr/share/X11/xorg.conf.d/50-synaptics.conf


#safety for accident removal with rm -rf
touch ~/-@
sudo touch /-@
sudo touch /root/-@


#HOME FOLDER
mkdir ~/torrents
