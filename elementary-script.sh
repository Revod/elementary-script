# Clear the Terminal
clear

# Zenity
GUI=$(zenity --list --checklist \
	--height 400 \
	--width 800 \
	--title="elementary-script" \
	--text "Pick one or multiple Actions to execute." \
	--column=Picks \
	--column=Actions \
	--column=Description \
	TRUE "Update System" "Updates the package lists, the system packages and Applications."  \
	FALSE "Install Proprietary Drivers" "Installs the proprietary drivers."  \
	TRUE "Speed-Up Memory" "Installs preload and enables zRAM." \
	TRUE "Install Ubuntu Restricted Extras" "Installs commonly used applications with restricted copyright (mp3, avi, mpeg, TrueType, Java, Flash, Codecs)." \
	TRUE "Install Extra Multimedia Codecs" "Installs extra multimedia codecs." \
	TRUE "Install Support for Encrypted DVD's" "Installs support for playing encrypted DVD's." \
	TRUE "Install Support for Archive Formats" "Installs support for archive formats." \
	FALSE "Install GDebi" "Installs GDebi. A simple tool to install deb files." \
	TRUE "Install Google Chrome" "Installs Google Chrome. A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier." \
	FALSE "Install Chromium" "Installs Chromium. An open-source browser project that aims to build a safer, faster, and more stable way for all Internet users to experience the web." \
	TRUE "Install Firefox" "Installs Firefox. A free and open-source web browser." \
	FALSE "Install Liferea" "Installs Liferea. a web feed reader/news aggregator that brings together all of the content from your favorite subscriptions into a simple interface that makes it easy to organize and browse feeds. Its GUI is similar to a desktop mail/newsclient, with an embedded graphical browser." \
	TRUE "Install VLC" "Installs VLC. A free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming protocols." \
	TRUE "Install Transmission" "Installs the Transmission BitTorrent client." \
	TRUE "Install Atom" "Installs Atom. A hackable text editor for the 21st Century." \
	FALSE "Install Sublime Text 3" "Installs Sublime Text 3. A sophisticated text editor for code, markup and prose." \
	TRUE "Install LibreOffice" "Installs LibreOffice. A powerful office suite." \
	TRUE "Install Numix Circle icon theme" "Add action description later..." \
	TRUE "Install Elementary tweaks" "Add action description later..." \
	TRUE "Install additional plank themes" "Add action description later..." \
	TRUE "Install Indicator USB" "Add action description later..." \
	TRUE "Install Indicator Multiload" "Add action description later..." \
	TRUE "Install Y PPA Manager" "Add action description later..." \
	TRUE "Install f.lux" "Add action description later..." \
	TRUE "Install Gnome system monitor" "Add action description later..." \
	TRUE "Install Caffeine" "Add action description later..." \
	TRUE "Install Copyq" "Add action description later..." \
	TRUE "Install Gnome ENCFS manager" "Add action description later..." \
	TRUE "Install MEGASync client" "Add action description later..." \
	TRUE "Install Currency" "Add action description later..." \
	TRUE "Install Gnome disk utility" "Add action description later..." \
	TRUE "Install Configurator" "Add action description later..." \
	TRUE "Install MenuLibre" "Add action description later..." \
	TRUE "Install ElementaryPlus icons" "Add action description later..." \
	TRUE "Install Gimp" "Add action description later..." \
	TRUE "Install Envelope" "Add action description later..." \
	TRUE "Install Webby" "Add action description later..." \
	TRUE "Install FileZilla" "Add action description later..." \
	TRUE "Install FreshPlayerPlugin" "Add action description later..." \
	TRUE "Install Keys and Passwords" "Add action description later..." \
	TRUE "Install Inkscape" "Add action description later..." \
	TRUE "Install Remmina" "Add action description later..." \
	TRUE "Install Gnome maps" "Add action description later..." \
	TRUE "Install Mark my words" "Add action description later..." \
	TRUE "Install Mumble" "Add action description later..." \
	TRUE "Install Brasero" "Add action description later..." \
	TRUE "Install NaSC" "Add action description later..." \
	TRUE "Install Pinta" "Add action description later..." \
	TRUE "Install SmartGit" "Add action description later..." \
	TRUE "Install Spotify" "Add action description later..." \
	TRUE "Install Tomato" "Add action description later..." \
	TRUE "Install Vocal" "Add action description later..." \
	TRUE "Install Relay" "Add action description later..." \
	TRUE "Install Imgur contract" "Add action description later..." \
	TRUE "Install Hourglass" "Add action description later..." \
	TRUE "Install Steam" "Add action description later..." \
	TRUE "Install Ubuntu make" "Add action description later..." \
	TRUE "Install Simple screen recorder" "Add action description later..." \
	TRUE "Install Cheese" "Add action description later..." \
	TRUE "Install Gnome media recorder" "Add action description later..." \
	TRUE "Install Trimage" "Add action description later..." \
	TRUE "Install GPick" "Add action description later..." \
	TRUE "Combine elementaryPlus and Numic icon sets" "Add action description later..." \
	TRUE "Fix Broken Packages" "Fixes the broken packages." \
	TRUE "Clean-Up Junk" "Removes unnecessary packages and the local repository of retrieved package files." \
	TRUE "Post-install system update" "Update the package list, the system packages and Applications." \
	--separator=', ');

# Update System Action
if [[ $GUI == *"Update System"* ]]
then
	clear
	echo "Updating system..."
	echo ""
	sudo apt-get -y update
	sudo apt-get -y dist-upgrade
fi

# Install Proprietary Drivers Action
if [[ $GUI == *"Install Proprietary Drivers"* ]]
then
	clear
	echo "Installing Proprietary Drivers..."
	echo ""
	sudo jockey-gtk
fi

# Speed-Up Memory Action
if [[ $GUI == *"Speed-Up Memory"* ]]
then
	clear
	echo "Speeding-up Memory..."
	echo ""
	sudo apt-get -y install preload
	sudo apt-get -y install zram-config
fi

# Install Ubuntu Restricted Extras Action
if [[ $GUI == *"Install Ubuntu Restricted Extras"* ]]
then
	clear
	echo "Installing Ubuntu Restricted Extras..."
	echo ""
	sudo apt-get -y install ubuntu-restricted-extras
fi

# Install Extra Multimedia Codecs Action
if [[ $GUI == *"Install Extra Multimedia Codecs"* ]]
then
	clear
	echo "Installing Extra Multimedia Codecs..."
	echo ""
	sudo apt-get -y install libavcodec-extra-54
fi

# Install Support for Encrypted DVD's Action
if [[ $GUI == *"Install Support for Encrypted DVD's"* ]]
then
	clear
	echo "Installing Support for Encrypted DVD's..."
	echo ""
	sudo apt-get -y install libdvdread4
	sudo /usr/share/doc/libdvdread4/install-css.sh
fi

# Install Support for Archive Formats Action
if [[ $GUI == *"Install Support for Archive Formats"* ]]
then
	clear
	echo "Installing Support for Archive Formats"
	echo ""
	sudo apt-get -y install zip unzip p7zip p7zip-rar rar unrar
fi

# Install GDebi Action
if [[ $GUI == *"Install GDebi"* ]]
then
	clear
	echo "Installing GDebi..."
	echo ""
	sudo apt-get -y install gdebi
fi

# Install Google Chrome Action
if [[ $GUI == *"Install Google Chrome"* ]]
then
	clear
	echo "Installing Google Chrome..."
	echo ""
	if [[ $(uname -m) == "i686" ]]
	then
		wget -O /tmp/google-chrome-stable_current_i386.deb https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
		sudo dpkg -i /tmp/google-chrome-stable_current_i386.deb
	elif [[ $(uname -m) == "x86_64" ]]
	then
		wget -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
	fi
fi

# Install Chromium
if [[ $GUI == *"Install Chromium"* ]]
then
	clear
	echo "Installing Chromium..."
	echo ""
	sudo apt-get -y install chromium-browser
fi

# Install Firefox Action
if [[ $GUI == *"Install Firefox"* ]]
then
	clear
	echo "Installing Firefox..."
	echo ""
	sudo apt-get -y install firefox
	sudo apt-get -y install ttf-lyx
fi

# Install Liferea Action
if [[ $GUI == *"Install Liferea"* ]]
then
	clear
	echo "Installing Liferea..."
	echo ""
	sudo apt-get -y install liferea
fi

# Install VLC Action
if [[ $GUI == *"Install VLC"* ]]
then
	clear
	echo "Installing VLC..."
	echo ""
	sudo apt-add-repository -y ppa:videolan/stable-daily
	sudo apt-get -y update
	sudo apt-get -y install vlc
fi

# Install Transmission Action
if [[ $GUI == *"Install Transmission"* ]]
then
	clear
	echo "Installing Transmission..."
	echo ""
	sudo add-apt-repository -y ppa:transmissionbt/ppa
	sudo apt-get -y update
	sudo apt-get -y install transmission
fi

# Install Atom Action
if [[ $GUI == *"Install Atom"* ]]
then
	clear
	echo "Installing Atom..."
	echo ""
	sudo add-apt-repository -y ppa:webupd8team/atom
	sudo apt-get -y update
	sudo apt-get -y install atom
fi

# Install Sublime Text 3 Action
if [[ $GUI == *"Install Sublime Text 3"* ]]
then
	clear
	echo "Installing Sublime Text 3..."
	echo ""
	sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
	sudo apt-get -y update
	sudo apt-get -y install sublime-text-installer
fi

# Install LibreOffice
if [[ $GUI == *"Install LibreOffice"* ]]
then
	clear
	echo "Installing LibreOffice..."
	echo ""
	sudo add-apt-repository -y ppa:libreoffice/ppa
	sudo apt-get -y update
	sudo apt-get -y install libreoffice
fi

# Install Numix Circle icon theme
if [[ $GUI == *"Install Numix Circle icon theme"* ]]
then
	clear
	echo "Installing Numix Circle icon theme..."
	echo ""
	sudo apt-add-repository -y ppa:numix/ppa
	sudo apt-get -y update
	sudo apt-get -y install numix-icon-theme-circle
fi

# Install Elementary tweaks
if [[ $GUI == *"Install Elementary tweaks"* ]]
then
	clear
	echo "Installing Elementary tweaks..."
	echo ""
	curl -sL  http://i-hate-farms.github.io/spores/install | sudo bash - 
	sudo apt-get -y install elementary-tweaks
fi

# Install additional plank themes
if [[ $GUI == *"Install additional plank themes"* ]]
then
	clear
	echo "Installing additional plank themes..."
	echo ""
	wget -O /tmp/elementary-plank-themes_0.4-0%7E4%7Eubuntu0.3.1_all.deb https://launchpad.net/~versable/+archive/ubuntu/elementary-tweaks-isis/+files/elementary-plank-themes_0.4-0%7E4%7Eubuntu0.3.1_all.deb
	sudo dpkg -i /tmp/elementary-plank-themes_0.4-0%7E4%7Eubuntu0.3.1_all.deb
fi

# Install Indicator USB
if [[ $GUI == *"Install Indicator USB"* ]]
then
	clear
	echo "Installing Indicator USB..."
	echo ""
	sudo add-apt-repository -y ppa:yunnxx/gnome3
	sudo apt-get -y update
	sudo apt-get -y install indicator-usb
fi

# Install Indicator Multiload
if [[ $GUI == *"Install Indicator Multiload"* ]]
then
	clear
	echo "Installing Indicator Multiload..."
	echo ""
	sudo add-apt-repository -y ppa:indicator-multiload/stable-daily
	sudo apt-get -y update
	sudo apt-get -y install indicator-multiload
fi

# Install Y PPA Manager
if [[ $GUI == *"Install Y PPA Manager"* ]]
then
	clear
	echo "Installing Y PPA Manager..."
	echo ""
	sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager 
	sudo apt-get -y update
	sudo apt-get -y install y-ppa-manager
fi

# Install f.lux
if [[ $GUI == *"Install f.lux"* ]]
then
	clear
	echo "Installing f.lux..."
	echo ""
	sudo add-apt-repository -y ppa:kilian/f.lux
	sudo apt-get -y update
	sudo apt-get -y install fluxgui
fi

# Install Gnome system monitor
if [[ $GUI == *"Install Gnome system monitor"* ]]
then
	clear
	echo "Installing Gnome system monitor..."
	echo ""
	sudo add-apt-repository -y ppa:gnome3-team/gnome3
	sudo apt-get -y update
	sudo apt-get -y install gnome-system-monitor
	sudo add-apt-repository -y --remove ppa:whatever/ppa
	sudo apt-get -y update
fi

# Install Caffeine
if [[ $GUI == *"Install Caffeine"* ]]
then
	clear
	echo "Installing Caffeine..."
	echo ""
	sudo add-apt-repository -y ppa:noobslab/indicators
	sudo apt-get -y update
	sudo apt-get -y install caffeine
fi

# Install Copyq
if [[ $GUI == *"Install Copyq"* ]]
then
	clear
	echo "Installing Copyq..."
	echo ""
	sudo add-apt-repository -y ppa:noobslab/indicators
	sudo apt-get -y update
	sudo apt-get -y install copyq
fi

# Install Gnome ENCFS manager
if [[ $GUI == *"Install Gnome ENCFS manager"* ]]
then
	clear
	echo "Installing Gnome ENCFS manager..."
	echo ""
	sudo add-apt-repository -y ppa:gencfsm
	sudo apt-get -y update
	sudo apt-get -y install gnome-encfs-manager
fi

# Install MEGASync client
if [[ $GUI == *"Install MEGASync client"* ]]
then
	clear
	echo "Installing MEGASync client..."
	echo ""
	if [[ $(uname -m) == "i686" ]]
	then
		wget -O /tmp/megasync-xUbuntu_14.04_i386.deb https://mega.nz/linux/MEGAsync/xUbuntu_14.04/i386/megasync-xUbuntu_14.04_i386.deb
		sudo dpkg -i /tmp/megasync-xUbuntu_14.04_i386.deb
	elif [[ $(uname -m) == "x86_64" ]]
	then
		wget -O /tmp/megasync-xUbuntu_14.04_amd64.deb https://mega.nz/linux/MEGAsync/xUbuntu_14.04/amd64/megasync-xUbuntu_14.04_amd64.deb
		sudo dpkg -i /tmp/megasync-xUbuntu_14.04_amd64.deb
	fi
fi

# Install Currency
if [[ $GUI == *"Install Currency"* ]]
then
	clear
	echo "Installing Currency..."
	echo ""
	sudo add-apt-repository -y "ppa:grabli66-r/eos"
	sudo apt-get -y update
	sudo apt-get -y install currency
fi

# Install Gnome disk utility
if [[ $GUI == *"Install Gnome disk utility"* ]]
then
	clear
	echo "Installing Gnome disk utility..."
	echo ""
	sudo apt-get -y install gnome-disk-utility 
fi

# Install Configurator
if [[ $GUI == *"Install Configurator"* ]]
then
	clear
	echo "Installing Configurator..."
	echo ""
	sudo add-apt-repository -y ppa:l-admin-3/apps-daily
	sudo apt-get -y update
	sudo apt-get -y install configurator
fi

# Install MenuLibre
if [[ $GUI == *"Install MenuLibre"* ]]
then
	clear
	echo "Installing MenuLibre..."
	echo ""
	sudo add-apt-repository -y ppa:menulibre-dev/devel
	sudo apt-get -y update
	sudo apt-get -y install menulibre
fi

# Install ElementaryPlus icons
if [[ $GUI == *"Install ElementaryPlus icons"* ]]
then
	clear
	echo "Installing ElementaryPlus icons..."
	echo ""
	sudo add-apt-repository -y ppa:cybre/elementaryplus
	sudo apt-get -y update
	sudo apt-get -y install elementaryplus
fi

# Install Gimp
if [[ $GUI == *"Install Gimp"* ]]
then
	clear
	echo "Installing Gimp..."
	echo ""
	sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
	sudo apt-get -y update
	sudo apt-get -y install gimp
fi

# Install Envelope
if [[ $GUI == *"Install Envelope"* ]]
then
	clear
	echo "Installing Envelope..."
	echo ""
	sudo add-apt-repository -y ppa:nicolas-laplante/envelope-daily
	sudo apt-get -y update
	sudo apt-get -y install envelope
fi

# Install Webby
if [[ $GUI == *"Install Webby"* ]]
then
	clear
	echo "Installing Webby..."
	echo ""
	sudo add-apt-repository -y ppa:erasmo-marin/webby-browser
	sudo apt-get -y update
	sudo apt-get -y install webby-browser
fi

# Install FileZilla
if [[ $GUI == *"Install FileZilla"* ]]
then
	clear
	echo "Installing FileZilla..."
	echo ""
	sudo add-apt-repository -y ppa:n-muench/programs-ppa2
	sudo apt-get -y update
	sudo apt-get -y install filezilla
fi

# Install FreshPlayerPlugin
if [[ $GUI == *"Install FreshPlayerPlugin"* ]]
then
	clear
	echo "Installing FreshPlayerPlugin..."
	echo ""
	sudo add-apt-repository -y ppa:nilarimogard/webupd8
	sudo apt-get -y update
	sudo apt-get -y install freshplayerplugin
fi

# Install Keys and Passwords
if [[ $GUI == *"Install Keys and Passwords"* ]]
then
	clear
	echo "Installing Keys and Passwords..."
	echo ""
	sudo apt-get -y install seahorse
fi

# Install Inkscape
if [[ $GUI == *"Install Inkscape"* ]]
then
	clear
	echo "Installing Inkscape..."
	echo ""
	sudo add-apt-repository -y ppa:inkscape.dev/stable
	sudo apt-get -y update
	sudo apt-get -y install inkscape
fi

# Install Remmina
if [[ $GUI == *"Install Remmina"* ]]
then
	clear
	echo "Installing Remmina..."
	echo ""
	sudo apt-get -y install remmina
fi

# Install Gnome maps
if [[ $GUI == *"Install Gnome maps"* ]]
then
	clear
	echo "Installing Gnome maps..."
	echo ""
	sudo apt-get -y install gnome-maps
fi

# Install Mark my words
if [[ $GUI == *"Install Mark my words"* ]]
then
	clear
	echo "Installing Mark my words..."
	echo ""
	sudo add-apt-repository -y ppa:voldyman/markmywords
	sudo apt-get -y update
	sudo apt-get -y install mark-my-words
fi

# Install Mumble
if [[ $GUI == *"Install Mumble"* ]]
then
	clear
	echo "Installing Mumble..."
	echo ""
	sudo add-apt-repository -y ppa:mumble/release
	sudo apt-get -y update
	sudo apt-get -y install mumble
fi

# Install Brasero
if [[ $GUI == *"Install Brasero"* ]]
then
	clear
	echo "Installing Brasero..."
	echo ""
	sudo apt-get -y install brasero
fi

# Install NaSC
if [[ $GUI == *"Install NaSC"* ]]
then
	clear
	echo "Installing NaSC..."
	echo ""
	sudo add-apt-repository -y ppa:nasc-team/daily
	sudo apt-get -y update
	sudo apt-get -y install nasc
fi

# Install Pinta
if [[ $GUI == *"Install Pinta"* ]]
then
	clear
	echo "Installing Pinta..."
	echo ""
	sudo add-apt-repository -y ppa:pinta-maintainers/pinta-stable
	sudo apt-get -y update
	sudo apt-get -y install pinta
fi

# Install SmartGit
if [[ $GUI == *"Install SmartGit"* ]]
then
	clear
	echo "Installing SmartGit..."
	echo ""
	sudo add-apt-repository -y ppa:eugenesan/ppa
	sudo apt-get -y update
	sudo apt-get -y install smartgit
fi

# Install Spotify
if [[ $GUI == *"Install Spotify"* ]]
then
	clear
	echo "Installing Spotify - input will we required"
	echo ""
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get -y update
	sudo apt-get -y install spotify-client
fi

# Install Tomato
if [[ $GUI == *"Install Tomato"* ]]
then
	clear
	echo "Installing Tomato..."
	echo ""
	sudo add-apt-repository -y ppa:tomato-team/tomato-stable
	sudo apt-get -y update
	sudo apt-get -y install tomato
fi

# Install Vocal
if [[ $GUI == *"Install Vocal"* ]]
then
	clear
	echo "Installing Vocal..."
	echo ""
	sudo add-apt-repository -y ppa:nathandyer/vocal-daily
	sudo apt-get -y update
	sudo apt-get -y install vocal
fi

# Install Relay
if [[ $GUI == *"Install Relay"* ]]
then
	clear
	echo "Installing Relay..."
	echo ""
	sudo add-apt-repository -y ppa:agronick/ppa
	sudo apt-get -y update
	sudo apt-get -y install relay
fi

# Install Imgur contract
if [[ $GUI == *"Install Imgur contract"* ]]
then
	clear
	echo "Installing Imgur contract..."
	echo ""
	sudo add-apt-repository -y ppa:cybre/imgurcontract
	sudo apt-get -y update
	sudo apt-get -y install imgur-contract
fi

# Install Hourglass
if [[ $GUI == *"Install Hourglass"* ]]
then
	clear
	echo "Installing Hourglass..."
	echo ""
	sudo add-apt-repository -y ppa:hourglass-team/hourglass-daily
	sudo apt-get -y update
	sudo apt-get -y install hourglass
fi

# Install Steam
if [[ $GUI == *"Install Steam"* ]]
then
	clear
	echo "Installing Steam - input will be required"
	echo ""
	sudo apt-get -y install steam
fi

# Install Ubuntu make
if [[ $GUI == *"Install Ubuntu make"* ]]
then
	clear
	echo "Installing Ubuntu make..."
	echo ""
	sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
	sudo apt-get -y update
	sudo apt-get -y install ubuntu-make
fi

# Install Install Simple screen recorder
if [[ $GUI == *"Install Simple screen recorder"* ]]
then
	clear
	echo "Installing Install Simple screen recorder..."
	echo ""
	sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
	sudo apt-get -y update
	sudo apt-get -y install simplescreenrecorder
fi

# Install Cheese
if [[ $GUI == *"Install Cheese"* ]]
then
	clear
	echo "Installing Cheese..."
	echo ""
	sudo apt-get -y install cheese
fi

# Install Gnome media recorder
if [[ $GUI == *"Install Gnome media recorder"* ]]
then
	clear
	echo "Installing Gnome media recorder..."
	echo ""
	sudo apt-get -y install gnome-media
fi

# Install Trimage
if [[ $GUI == *"Install Trimage"* ]]
then
	clear
	echo "Installing Trimage..."
	echo ""
	sudo apt-get -y install trimage
fi

# Install GPick
if [[ $GUI == *"Install GPick"* ]]
then
	clear
	echo "Installing Trimage..."
	echo ""
	sudo apt-get -y install gpick
fi

# Install Combine elementaryPlus and Numic icon sets
if [[ $GUI == *"Combine elementaryPlus and Numic icon sets"* ]]
then
	clear
	echo "Combineing elementaryPlus and Numic icon sets..."
	echo ""
	sudo curl https://raw.githubusercontent.com/michaldaniel/elementary-script/master/resources/numix-circle.index.theme > /usr/share/icons/Numix-Circle/index.theme
	sudo curl https://raw.githubusercontent.com/michaldaniel/elementary-script/master/resources/elementay-plus.index.theme > /usr/share/icons/elementaryPlus/index.theme
fi

# Fix Broken Packages Action
if [[ $GUI == *"Fix Broken Packages"* ]]
then
	clear
	echo "Fixing the broken packages..."
	echo ""
	sudo apt-get -y -f install
fi

# Clean-Up Junk Action
if [[ $GUI == *"Clean-Up Junk"* ]]
then
	clear
	echo "Cleaning-up junk..."
	echo ""
	sudo apt-get -y autoremove
	sudo apt-get -y autoclean
fi

# Post-install system update
if [[ $GUI == *"Post-install system update"* ]]
then
	clear
	echo "Post-install system update..."
	echo ""
	sudo apt-get -y update
	sudo apt-get -y upgrade
fi


# Notification
clear
notify-send -i utilities-terminal elementary-script "All tasks ran successfully!"
