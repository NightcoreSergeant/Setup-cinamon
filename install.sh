#!/bin/bash


cd && mkdir git

#to mint linux
sudo apt-get update -y
sudo apt-get install cinnamon-desktop-environment -y

#zsh
 sudo sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" -y

#Clipt(when you mark auto copy)
sudo apt-get install ClipIt -y

#nylas mail
wget https://edgehill.nylas.com/download?platform=linux-deb
sudo dpkg -i 'download?platform=linux-deb' -y
sudo apt-get install -f -y
cp .nylas/config.cson ~/.nylas/

#For better use
sudo apt-get install python3 -y
sudo apt-get install redshift -y
sudo apt-get install atom -y
sudo apt-get install ipython3 -y
sudo apt-get install htop -y
sudo apt-get install plank -y
sudo apt-get install pidgin -y
sudo apt-get install tmux -y
sudo apt-get -y install mpv -y
sudo apt-get install xclip -y
#sudo apt-get -y install arp-scan -y #hacking tools
sudo apt-get -y install 7z -y      #zip
sudo apt-get -y install unzip -y   #unzip
sudo apt-get -y install zip -y  #zip
sudo apt-get install python3-setuptools -y #for pip
sudo easy_install3 pip -y #for pip 
sudo pip install --upgrade pip -y

#Themes
  #window borders
  	#arc
cd ~/git && git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
./autogen.sh --prefix=/usr -y
sudo make install -y
gsettings set org.gnome.metacity theme Arc -y
cd  
  #icons
  	#numix-cricle
sudo apt-add-repository ppa:numix/ppa
sudo apt-get update -y
sudo apt-get install numix-icon-theme-circle
gsettings set org.gnome.desktop.interface icon-theme 'numix-cricle'
  #controls
  	#flatabulous
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update -y
sudo apt-get install flatabulous-theme
gsettings set org.gnome.desktop.interface control-theme 'Flatabulous'
  #mouse pointer
  	#DMZ-White
  #desktop
  	#Android_Holo
cd ~/git && wget https://cinnamon-spices.linuxmint.com/uploads/themes/9296-RBPC-HAT0.zip
unzip file.zip -d ~/.themes
rm 9296-RBPC-HAT0.zip
gsettings set org.gnome.desktop.wm.preferences theme "Android_Holo"
cd
#background
  gsettings set org.gnome.desktop.background primary-color "#000000"
gsettings set org.gnome.desktop.background secondary-color "#000000"
gsettings set org.gnome.desktop.background color-shading-type "solid"

#bing wallpaper
cd ~/git && git clone https://github.com/dcrystalj/bing-wallpaper.git --depth 1
sh ./install.sh -y

#Configs for tmux zsh pidgin ssh.
cd ~/git
git clone https://github.com/dcrystalj/dotfiles
cd dotfiles
cp -r .config ~/
cp -r .ssh ~/
cp -r .purple ~/
cp -r .tmux.conf ~/
cp -r .zshrc ~/

#Bluethoot problems
sudo rfkill block bluetooth
sudo echo disable > /proc/acpi/ibm/bluetooth
sudo systemctl disable bluetooth.service

#git
cd ~/.ssh && ssh-keygen
cat id_rsa.pub | xclip
git config --global user.name "NightcoreSergeant"
git config --global user.email "tomazic.tadej@gmail.com"
git config --global push.default simple
sudo chown -R $USER:$USER "$(git rev-parse --show-toplevel)/.git" #problems to pull()
sudo chown -R $(id -u):$(id -g) "$(git rev-parse --show-toplevel)/.git" #problems to pull(illegal group name)
cd ~/git && git init
cd
#To remove all not important stuff(unity)
sudo apt-get purge unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-colourlovers unity-scope-devhelp unity-scope-firefoxbookmarks unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-manpages unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-yelp unity-scope-zotero unity-lens-music unity-lens-photos unity-lens-video

#skype
#wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
#sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
#rm skype-ubuntu-precise_4.3.0.37-1_i386.deb

#atom
cd ~/git && wget https://atom.io/download/deb
sudo dpkg -i deb
sudo apt-get install -f
cp .atom/config.cson ~/.atom
rm ~/git/deb

  #atom script
cd ~/git/
git clone https://github.com/rgbkrk/atom-script
cd atom-script
apm link -y
apm install script -y #(in menubar Atom > Install Shell Commands)
apm install -y
cd

#atom-beta
cd ~/git && wget https://atom.io/download/deb?channel=beta
sudo dpkg -i deb\?channel=beta -y
sudo apt-get install -f -y
rm deb\?channel=beta
cd

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

#destroy nano
cd /bin
sudo mv nano nano_must_die
sudo ln -s /usr/bin/vim nano
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1 -y

#vim with LUA
sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common -y

sudo apt-get build-dep vim-gnome -y

sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev -y

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


#youtube player
cd ~/git && git clone https://github.com/agiz/youtube-mpv --depth 1
./git/youtube-mpv/install-ubuntu.sh
cd

#OTHER SETTINGS(if not mention don't change anything)
 #background- off,no picture,none,black

 #themes- mention in 24line

 #accessibility- all off

 #desktop- dektop
  #icons(all off),
  #allow icons from missing monitors to be displayed on the existing ones(ON)

 #extensions- cinamon maximus
cd ~/git && wget https://cinnamon-spices.linuxmint.com/uploads/extensions/SPMS-GHT1-9M8U.zip
unzip SPMS-GHT1-9M8U.zip -d ~/.local/share/cinnamon/extensions/
sudo rm SPMS-GHT1-9M8U.zip
sudo mv -f ~/git/SetUpForMint/settings-shema.jason ~/.local/share/cinnamon/extensions/
cd

#THE END
sudo reboot
