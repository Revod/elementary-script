# Clear the Terminal
clear

#Get user distribution
distro=$(lsb_release -c | cut -f2)
#Hardcoded target distribution Freya
targetDistro=freya

if [ "$distro" != "$targetDistro" ]; then
  echo "This script wasn't created for your distribution."
  echo "You are using $distro, this script was made for $targetDistro."
  echo "If it doesn't seem right, check for updated version."
  exit 1
fi
echo -----------------------------------------------------
echo "I am not responsible for any damages that may occur from using this script!"
echo "Please mind that this script will add new personal package archives."
echo "The script will need root permissions to perform it's actions."
echo -----------------------------------------------------
sleep 4
echo "   "
echo "Drawing GUI..."
# Zenity
GUI=$(zenity --list --checklist \
	--height 560 \
	--width 800 \
	--title="elementary-script" \
	--text "Pick one or multiple actions to execute." \
	--column=Picks \
	--column=Actions \
	--column=Description \
	TRUE "Update System" "Updates the package lists, the system packages and Applications."  \
	TRUE "Install Proprietary Drivers" "Installs the proprietary drivers."  \
	TRUE "Speed-Up Memory" "Installs preload and enables zRAM." \
	TRUE "Install Ubuntu Restricted Extras" "Installs commonly used applications with restricted copyright (mp3, avi, mpeg, TrueType, Java, Flash, Codecs)." \
	TRUE "Install Extra Multimedia Codecs" "Installs extra multimedia codecs." \
	TRUE "Install Support for Encrypted DVD's" "Installs support for playing encrypted DVD's." \
	TRUE "Install Support for Archive Formats" "Installs support for archive formats." \
	FALSE "Optimise battery performance" "Add action description later..." \
	FALSE "Install Power Installer" "Installs Power Installer. A simple tool to install deb files." \
	FALSE "Install Google Chrome" "Installs Google Chrome. A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier." \
	FALSE "Install Chromium" "Installs Chromium. An open-source browser project that aims to build a safer, faster, and more stable way for all Internet users to experience the web." \
	FALSE "Install Firefox" "Installs Firefox. A free and open-source web browser." \
	FALSE "Install FreshPlayerPlugin" "Add action description later..." \
	FALSE "Install Oracle Java 8" "Add action description later..." \
	FALSE "Install Pipelight Silverlight" "Add action description later..." \
	FALSE "Install Infinality" "Add action description later..." \
	FALSE "Install FeedReader" "Installs FeedReader. a web feed reader/news aggregator that brings together all of the content from your favorite subscriptions into a simple interface that makes it easy to organize and browse feeds. Its GUI is similar to a desktop mail/newsclient, with an embedded graphical browser." \
	FALSE "Install VLC" "Installs VLC. A free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming protocols." \
	FALSE "Install Transmission" "Installs the Transmission BitTorrent client." \
	FALSE "Install LibreOffice" "Installs LibreOffice. A powerful office suite." \
	FALSE "Install Numix Circle Icons" "Add action description later..." \
	FALSE "Install ElementaryPlus icons" "Add action description later..." \
	FALSE "Install Ultra flat icons" "Add action description later..." \
	FALSE "Install Arc Theme" "Add action description later..." \
	FALSE "Install additional plank themes" "Add action description later..." \
	FALSE "Install Elementary tweaks" "Add action description later..." \
	FALSE "Install MenuLibre" "Add action description later..." \
	FALSE "Install Caffeine" "Add action description later..." \
	FALSE "Install Glipper" "Add action description later..." \
	FALSE "Install Indicator USB" "Add action description later..." \
	FALSE "Install Indicator Multiload" "Add action description later..." \
	FALSE "Install Gnome system monitor" "Add action description later..." \
	FALSE "Install Gnome disk utility" "Add action description later..." \
	FALSE "Install Gnome ENCFS manager" "Add action description later..." \
	FALSE "Install MEGASync client" "Add action description later..." \
	FALSE "Install Insync" "Add action description later..." \
	FALSE "Install Y PPA Manager" "Add action description later..." \
	FALSE "Install f.lux" "Add action description later..." \
	FALSE "Install Currency" "Add action description later..." \
	FALSE "Install Configurator" "Add action description later..." \
	FALSE "Install Envelope" "Add action description later..." \
	FALSE "Install Webby" "Add action description later..." \
	FALSE "Install FileZilla" "Add action description later..." \
	FALSE "Install Keys and Passwords" "Add action description later..." \
	FALSE "Install Inkscape" "Add action description later..." \
	FALSE "Install Remmina" "Add action description later..." \
	FALSE "Install Gnome maps" "Add action description later..." \
	FALSE "Install Mark my words" "Add action description later..." \
	FALSE "Install Mumble" "Add action description later..." \
	FALSE "Install Brasero" "Add action description later..." \
	FALSE "Install NaSC" "Add action description later..." \
	FALSE "Install Gimp" "Add action description later..." \
	FALSE "Install Pinta" "Add action description later..." \
	FALSE "Install MyPaint" "Add action description later..." \
	FALSE "Install SmartGit" "Add action description later..." \
	FALSE "Install Spotify" "Add action description later..." \
	FALSE "Install Tomato" "Add action description later..." \
	FALSE "Install Go For It!" "Add action description later..." \
	FALSE "Install Vocal" "Add action description later..." \
	FALSE "Install Footnote" "Add action description later..." \
	FALSE "Install Relay" "Add action description later..." \
	FALSE "Install Skype" "Add action description later..." \
	FALSE "Install Telegram" "Add action description later..." \
	FALSE "Install Imgur contract" "Add action description later..." \
	FALSE "Install Hourglass" "Add action description later..." \
	FALSE "Install Steam" "Add action description later..." \
	FALSE "Install Atom" "Installs Atom. A hackable text editor for the 21st Century." \
	FALSE "Install Sublime Text 3" "Installs Sublime Text 3. A sophisticated text editor for code, markup and prose." \
	FALSE "Install Ubuntu make" "Add action description later..." \
	FALSE "Install Record my Desktop" "Add action description later..." \
	FALSE "Install Simple screen recorder" "Add action description later..." \
	FALSE "Install Gnome media recorder" "Add action description later..." \
	FALSE "Install Cheese" "Add action description later..." \
	FALSE "Install Trimage" "Add action description later..." \
	FALSE "Install GPick" "Add action description later..." \
	TRUE "Fix Broken Packages" "Fixes the broken packages." \
	TRUE "Clean-Up Junk" "Removes unnecessary packages and the local repository of retrieved package files." \
	TRUE "Post-install system update" "Update the package list, the system packages and Applications." \
	--separator=', ');

# Update in case Update System action not selected
clear
echo "Updating packages list..."
echo ""
sudo apt-get -y update

# Update System Action
if [[ $GUI == *"Update System"* ]]
then
	clear
	echo "Updating system..."
	echo ""
	sudo apt-get -y update
	sudo apt-get -y dist-upgrade
	notify-send -i utilities-terminal elementary-script "System update run successfully!"
fi

# Install Proprietary Drivers Action
if [[ $GUI == *"Install Proprietary Drivers"* ]]
then
	clear
	echo "Installing Proprietary Drivers..."
	echo ""
	sudo software-properties-gtk --open-tab=4
fi

# Speed-Up Memory Action
if [[ $GUI == *"Speed-Up Memory"* ]]
then
	clear
	echo "Speeding-up Memory..."
	echo ""
	sudo apt-get -y install preload
	sudo apt-get -y install zram-config
	notify-send -i utilities-terminal elementary-script "Speed-Up Memory run successfully!"
fi

# Install Ubuntu Restricted Extras Action
if [[ $GUI == *"Install Ubuntu Restricted Extras"* ]]
then
	clear
	echo "Installing Ubuntu Restricted Extras - input will be required..."
	echo ""
	sudo apt-get -y install ubuntu-restricted-extras
	notify-send -i utilities-terminal elementary-script "Ubuntu Restricted Extras installed successfully!"
fi

# Install Extra Multimedia Codecs Action
if [[ $GUI == *"Install Extra Multimedia Codecs"* ]]
then
	clear
	echo "Installing Extra Multimedia Codecs..."
	echo ""
	sudo apt-get -y install libavcodec-extra-54
	sudo apt-add-repository -y ppa:mc3man/trusty-media
	sudo apt-get -y update
	sudo apt-get -y dist-upgrade
	sudo apt-get -y install ffmpeg faac faad gstreamer0.10-ffmpeg x264 x265
	notify-send -i utilities-terminal elementary-script "Extra Multimedia Codecs installed successfully!"
fi

# Install Support for Encrypted DVD's Action
if [[ $GUI == *"Install Support for Encrypted DVD's"* ]]
then
	clear
	echo "Installing Support for Encrypted DVD's..."
	echo ""
	sudo apt-get -y install libdvdread4
	sudo /usr/share/doc/libdvdread4/install-css.sh
	notify-send -i utilities-terminal elementary-script "Support for Encrypted DVD's installed successfully!"
fi

# Install Support for Archive Formats Action
if [[ $GUI == *"Install Support for Archive Formats"* ]]
then
	clear
	echo "Installing Support for Archive Formats"
	echo ""
	sudo apt-get -y install zip unzip p7zip p7zip-rar rar unrar
	notify-send -i utilities-terminal elementary-script "Support for Archive Formats installed successfully!"
fi


# Optimise battery performance Action
if [[ $GUI == *"Optimise battery performance"* ]]
then
	clear
	echo "Optimising battery performance..."
	echo ""
	sudo add-apt-repository -y ppa:linrunner/tlp
	sudo apt-get -y update
	sudo apt-get -y install tlp tlp-rdw
	sudo tlp start
	sudo apt-get -y install thermald
	notify-send -i utilities-terminal elementary-script "Optimise battery performance ran successfully!"
fi

# Install Power Installer Action
if [[ $GUI == *"Install Power Installer"* ]]
then
	clear
	echo "Installing Power Installer..."
	echo ""
	sudo add-apt-repository -y ppa:donadigo/power-installer
	sudo apt-get -y update
	sudo apt-get -y install power-installer
	notify-send -i utilities-terminal elementary-script "Power Installer installed successfully!"
fi

# Install Google Chrome Action
if [[ $GUI == *"Install Google Chrome"* ]]
then
	clear
	echo "Installing Google Chrome..."
	echo ""
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	sudo apt-get -y update 
	sudo apt-get -y install google-chrome-stable
	notify-send -i utilities-terminal elementary-script "Google Chrome installed successfully!"
fi

# Install Chromium
if [[ $GUI == *"Install Chromium"* ]]
then
	clear
	echo "Installing Chromium..."
	echo ""
	sudo apt-get -y install chromium-browser
	notify-send -i utilities-terminal elementary-script "Chromium installed successfully!"
fi

# Install Firefox Action
if [[ $GUI == *"Install Firefox"* ]]
then
	clear
	echo "Installing Firefox..."
	echo ""
	sudo apt-get -y install firefox
	sudo apt-get -y install ttf-lyx
	notify-send -i utilities-terminal elementary-script "Firefox installed successfully!"
fi

# Install FeedReader Action
if [[ $GUI == *"Install FeedReader"* ]]
then
	clear
	echo "Installing FeedReader..."
	echo ""
	sudo add-apt-repository -y ppa:eviltwin1/feedreader-stable
	sudo apt-get -y update
	sudo apt-get install -y feedreader
	notify-send -i utilities-terminal elementary-script "FeedReader installed successfully!"
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
	notify-send -i utilities-terminal elementary-script "VLC installed successfully!"
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
	notify-send -i utilities-terminal elementary-script "Transmission installed successfully!"
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
	notify-send -i utilities-terminal elementary-script "Atom installed successfully!"
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
	notify-send -i utilities-terminal elementary-script "Sublime Text 3 installed successfully!"
fi

# Install LibreOffice Action
if [[ $GUI == *"Install LibreOffice"* ]]
then
	clear
	echo "Installing LibreOffice..."
	echo ""
	sudo add-apt-repository -y ppa:libreoffice/ppa
	sudo apt-get -y update
	sudo apt-get -y install libreoffice libreoffice-style-breeze
	notify-send -i utilities-terminal elementary-script "LibreOffice installed successfully!"
fi

# Install Numix Circle Icons Action
if [[ $GUI == *"Install Numix Circle Icons"* ]]
then
	clear
	echo "Installing Numix Circle Icons..."
	echo ""
	sudo apt-add-repository -y ppa:numix/ppa
	sudo apt-get -y update
	sudo apt-get -y install numix-icon-theme-circle
	notify-send -i utilities-terminal elementary-script "Numix Circle Icons installed successfully!"
fi

# Install Elementary tweaks Action
if [[ $GUI == *"Install Elementary tweaks"* ]]
then
	clear
	echo "Installing Elementary tweaks..."
	echo ""
	curl -sL  'http://i-hate-farms.github.io/spores/install' | sudo bash - 
	sudo apt-get -y install elementary-tweaks
	notify-send -i utilities-terminal elementary-script "Elementary tweaks installed successfully!"
fi

# Install additional plank themes Action
if [[ $GUI == *"Install additional plank themes"* ]]
then
	clear
	echo "Installing additional plank themes..."
	echo ""
	wget -O /tmp/elementary-plank-themes_0.4-0%7E4%7Eubuntu0.3.1_all.deb https://launchpad.net/~versable/+archive/ubuntu/elementary-tweaks-isis/+files/elementary-plank-themes_0.4-0%7E4%7Eubuntu0.3.1_all.deb
	sudo dpkg -i /tmp/elementary-plank-themes_0.4-0%7E4%7Eubuntu0.3.1_all.deb
	sudo apt-get install -f -y
	notify-send -i utilities-terminal elementary-script "Additional plank themes installed successfully!"
fi

# Install Indicator USB Action
if [[ $GUI == *"Install Indicator USB"* ]]
then
	clear
	echo "Installing Indicator USB..."
	echo ""
	sudo add-apt-repository -y ppa:yunnxx/gnome3
	sudo apt-get -y update
	sudo apt-get -y install indicator-usb
	notify-send -i utilities-terminal elementary-script "Indicator USB installed successfully!"
fi

# Install Indicator Multiload Action
if [[ $GUI == *"Install Indicator Multiload"* ]]
then
	clear
	echo "Installing Indicator Multiload..."
	echo ""
	sudo add-apt-repository -y ppa:indicator-multiload/stable-daily
	sudo apt-get -y update
	sudo apt-get -y install indicator-multiload
	notify-send -i utilities-terminal elementary-script "Indicator Multiload installed successfully!"
fi

# Install Y PPA Manager Action
if [[ $GUI == *"Install Y PPA Manager"* ]]
then
	clear
	echo "Installing Y PPA Manager..."
	echo ""
	sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager 
	sudo apt-get -y update
	sudo apt-get -y install y-ppa-manager
	notify-send -i utilities-terminal elementary-script "Y PPA Manager installed successfully!"
fi

# Install f.lux Action
if [[ $GUI == *"Install f.lux"* ]]
then
	clear
	echo "Installing f.lux..."
	echo ""
	sudo add-apt-repository -y ppa:kilian/f.lux
	sudo apt-get -y update
	sudo apt-get -y install fluxgui
	notify-send -i utilities-terminal elementary-script "f.lux installed successfully!"
fi

# Install Gnome system monitor Action
if [[ $GUI == *"Install Gnome system monitor"* ]]
then
	clear
	echo "Installing Gnome system monitor..."
	echo ""
	sudo add-apt-repository -y ppa:gnome3-team/gnome3
	sudo apt-get -y update
	sudo apt-get -y install gnome-system-monitor
	sudo add-apt-repository -y --remove ppa:gnome3-team/gnome3
	sudo apt-get -y update
	notify-send -i utilities-terminal elementary-script "Gnome system monitor installed successfully!"
fi

# Install Caffeine Action
if [[ $GUI == *"Install Caffeine"* ]]
then
	clear
	echo "Installing Caffeine..."
	echo ""
	sudo add-apt-repository -y ppa:caffeine-developers/ppa
	sudo apt-get -y update
	sudo apt-get -y install caffeine
	notify-send -i utilities-terminal elementary-script "Caffeine installed successfully!"
fi

# Install Glipper Action
if [[ $GUI == *"Install Glipper"* ]]
then
	clear
	echo "Installing Glipper..."
	echo ""
	sudo apt-get -y install glipper
	notify-send -i utilities-terminal elementary-script "Glipper installed successfully!"
fi

# Install Gnome ENCFS manager Action
if [[ $GUI == *"Install Gnome ENCFS manager"* ]]
then
	clear
	echo "Installing Gnome ENCFS manager..."
	echo ""
	sudo add-apt-repository -y ppa:gencfsm
	sudo apt-get -y update
	sudo apt-get -y install gnome-encfs-manager
	notify-send -i utilities-terminal elementary-script "Gnome ENCFS manager installed successfully!"
fi

# Install MEGASync client Action
if [[ $GUI == *"Install MEGASync client"* ]]
then
	clear
	echo "Installing MEGASync client..."
	echo ""
	if [[ $(uname -m) == "i386" ]]
	then
		wget -O /tmp/megasync-xUbuntu_14.04_i386.deb https://mega.nz/linux/MEGAsync/xUbuntu_14.04/i386/megasync-xUbuntu_14.04_i386.deb
		sudo dpkg -i /tmp/megasync-xUbuntu_14.04_i386.deb
	elif [[ $(uname -m) == "x86_64" ]]
	then
		wget -O /tmp/megasync-xUbuntu_14.04_amd64.deb https://mega.nz/linux/MEGAsync/xUbuntu_14.04/amd64/megasync-xUbuntu_14.04_amd64.deb
		sudo dpkg -i /tmp/megasync-xUbuntu_14.04_amd64.deb
	fi
	sudo apt-get install -f -y
	notify-send -i utilities-terminal elementary-script "MEGASync client installed successfully!"
fi

# Install Insync Action
if [[ $GUI == *"Install Insync"* ]]
then
	clear
	echo "Installing Insync..."
	echo ""
	echo "deb http://apt.insynchq.com/ubuntu trusty non-free" | sudo tee /etc/apt/sources.list.d/insync.list
	wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
	sudo apt-get -y update
	sudo apt-get -y install insync
	notify-send -i utilities-terminal elementary-script "Insync client installed successfully!"
fi

# Install Currency Action
if [[ $GUI == *"Install Currency"* ]]
then
	clear
	echo "Installing Currency..."
	echo ""
	sudo add-apt-repository -y "ppa:grabli66-r/eos"
	sudo apt-get -y update
	sudo apt-get -y install currency
	notify-send -i utilities-terminal elementary-script "Currency installed successfully!"
fi

# Install Gnome disk utility Action
if [[ $GUI == *"Install Gnome disk utility"* ]]
then
	clear
	echo "Installing Gnome disk utility..."
	echo ""
	sudo add-apt-repository -y ppa:gnome3-team/gnome3
	sudo apt-get -y update
	sudo apt-get -y install gnome-disk-utility 
	sudo add-apt-repository -y --remove ppa:gnome3-team/gnome3
	sudo apt-get -y update
	notify-send -i utilities-terminal elementary-script "Gnome disk utility installed successfully!"
fi

# Install Configurator Action
if [[ $GUI == *"Install Configurator"* ]]
then
	clear
	echo "Installing Configurator..."
	echo ""
	sudo add-apt-repository -y ppa:l-admin-3/apps-daily
	sudo apt-get -y update
	sudo apt-get -y install configurator
	notify-send -i utilities-terminal elementary-script "Configurator installed successfully!"
fi
aptik
# Install MenuLibre Action
if [[ $GUI == *"Install MenuLibre"* ]]
then
	clear
	echo "Installing MenuLibre..."
	echo ""
	sudo add-apt-repository -y ppa:menulibre-dev/devel
	sudo apt-get -y update
	sudo apt-get -y install menulibre
	notify-send -i utilities-terminal elementary-script "MenuLibre installed successfully!"
fi

# Install ElementaryPlus icons Action
if [[ $GUI == *"Install ElementaryPlus icons"* ]]
then
	clear
	echo "Installing ElementaryPlus icons..."
	echo ""
	sudo add-apt-repository -y ppa:cybre/elementaryplus
	sudo apt-get -y update
	sudo apt-get -y install elementaryplus
	notify-send -i utilities-terminal elementary-script "ElementaryPlus icons installed successfully!"
fi

# Install Ultra flat icons Action
if [[ $GUI == *"Install Ultra flat icons"* ]]
then
	clear
	echo "Installing Ultra flat icons..."
	echo ""
	sudo add-apt-repository -y ppa:noobslab/icons
	sudo apt-get -y update
	sudo apt-get -y install ultra-flat-icons
	notify-send -i utilities-terminal elementary-script "Ultra flat icons installed successfully!"
fi

# Install Arc Theme Actionaptik
if [[ $GUI == *"Install Arc Theme"* ]]
then
	clear
	echo "Installing Arc Theme..."
	echo ""
	sudo apt-get install -y gnome-themes-standard gtk2-engines-murrine
	sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
	wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.04/Release.key
	sudo apt-key add - < Release.key
	sudo rm Release.key
	sudo apt-get -y update
	sudo apt-get install -y arc-theme
	notify-send -i utilities-terminal elementary-script "Arc Theme installed successfully!"
fi

# Install Gimp Action
if [[ $GUI == *"Install Gimp"* ]]
then
	clear
	echo "Installing Gimp..."
	echo ""
	sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
	sudo apt-get -y update
	sudo apt-get -y install gimp
	notify-send -i utilities-terminal elementary-script "Gimp installed successfully!"
fi

# Install Envelope Action
if [[ $GUI == *"Install Envelope"* ]]
then
	clear
	echo "Installing Envelope..."
	echo ""
	sudo add-apt-repository -y ppa:nicolas-laplante/envelope-daily
	sudo apt-get -y update
	sudo apt-get -y install envelope
	notify-send -i utilities-terminal elementary-script "Envelope installed successfully!"
fi

# Install Webby Action
if [[ $GUI == *"Install Webby"* ]]
then
	clear
	echo "Installing Webby..."
	echo ""
	sudo add-apt-repository -y ppa:erasmo-marin/webby-browser
	sudo apt-get -y update
	sudo apt-get -y install webby-browser
	notify-send -i utilities-terminal elementary-script "Webby installed successfully!"
fi

# Install FileZilla Action
if [[ $GUI == *"Install FileZilla"* ]]
then
	clear
	echo "Installing FileZilla..."
	echo ""
	sudo add-apt-repository -y ppa:n-muench/programs-ppa2
	sudo apt-get -y update
	sudo apt-get -y install filezilla
	notify-send -i utilities-terminal elementary-script "FileZilla installed successfully!"
fi

# Install FreshPlayerPlugin Action
if [[ $GUI == *"Install FreshPlayerPlugin"* ]]
then
	clear
	echo "Installing FreshPlayerPlugin..."
	echo ""
	sudo add-apt-repository -y ppa:nilarimogard/webupd8
	sudo apt-get -y update
	sudo apt-get -y install freshplayerplugin
	sudo apt-get -y remove flashplugin-installer
	notify-send -i utilities-terminal elementary-script "FreshPlayerPlugin installed successfully!"
fi

# Install Oracle Java 8 Action
if [[ $GUI == *"Install Oracle Java 8"* ]]
then
	clear
	echo "Installing Oracle Java 8 - input will be required..."
	echo ""
	sudo add-apt-repository -y ppa:webupd8team/java
	sudo apt-get -y update
	sudo apt-get -y install oracle-java8-installer
	notify-send -i utilities-terminal elementary-script "Oracle Java 8 installed successfully!"
fi

# Install Pipelight Silverlight Action
if [[ $GUI == *"Install Pipelight Silverlight"* ]]
then
	clear
	echo "Installing Pipelight Silverlight - input will be required..."
	echo ""
	sudo add-apt-repository -y ppa:pipelight/stable
	sudo apt-get -y update
	sudo apt-get -y install pipelight
	sudo pipelight-plugin --update
	sudo pipelight-plugin --enable silverlight
	notify-send -i utilities-terminal elementary-script "Pipelight Silverlight installed successfully!"
fi


# Install Infinality Action
if [[ $GUI == *"Install Infinality"* ]]
then
	clear
	echo "Installing Infinality..."
	echo ""
	sudo add-apt-repository -y ppa:no1wantdthisname/ppa
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt-get -y install fontconfig-infinality
	sudo bash /etc/fonts/infinality/infctl.sh setstyle
	sudo perl -pi -e 's/USE_STYLE="DEFAULT"/USE_STYLE="INFINALITY"/g' /etc/profile.d/infinality-settings.sh
	notify-send -i utilities-terminal elementary-script "Infinality installed successfully!"
fi

# Install Keys and Passwords Action
if [[ $GUI == *"Install Keys and Passwords"* ]]
then
	clear
	echo "Installing Keys and Passwords..."
	echo ""
	sudo apt-get -y install seahorse
	notify-send -i utilities-terminal elementary-script "Keys and Passwords installed successfully!"
fi

# Install Inkscape Action
if [[ $GUI == *"Install Inkscape"* ]]
then
	clear
	echo "Installing Inkscape..."
	echo ""
	sudo add-apt-repository -y ppa:inkscape.dev/stable
	sudo apt-get -y update
	sudo apt-get -y install inkscape
	notify-send -i utilities-terminal elementary-script "Inkscape installed successfully!"
fi

# Install Remmina Action
if [[ $GUI == *"Install Remmina"* ]]
then
	clear
	echo "Installing Remmina..."
	echo ""
	sudo apt-get -y install remmina
	notify-send -i utilities-terminal elementary-script "Remmina installed successfully!"
fi

# Install Gnome maps Action
if [[ $GUI == *"Install Gnome maps"* ]]
then
	clear
	echo "Installing Gnome maps..."
	echo ""
	sudo apt-get -y install gnome-maps
	notify-send -i utilities-terminal elementary-script "Gnome maps installed successfully!"
fi

# Install Mark my words Action
if [[ $GUI == *"Install Mark my words"* ]]
then
	clear
	echo "Installing Mark my words..."
	echo ""
	sudo add-apt-repository -y ppa:voldyman/markmywords
	sudo apt-get -y update
	sudo apt-get -y install mark-my-words
	notify-send -i utilities-terminal elementary-script "Mark my words installed successfully!"
fi

# Install Mumble Action
if [[ $GUI == *"Install Mumble"* ]]
then
	clear
	echo "Installing Mumble..."
	echo ""
	sudo add-apt-repository -y ppa:mumble/release
	sudo apt-get -y update
	sudo apt-get -y install mumble
	notify-send -i utilities-terminal elementary-script "Mumble installed successfully!"
fi

# Install Brasero Action
if [[ $GUI == *"Install Brasero"* ]]
then
	clear
	echo "Installing Brasero..."
	echo ""
	sudo apt-get -y install brasero
	notify-send -i utilities-terminal elementary-script "Brasero installed successfully!"
fi

# Install NaSC Action
if [[ $GUI == *"Install NaSC"* ]]
then
	clear
	echo "Installing NaSC..."
	echo ""
	sudo add-apt-repository -y ppa:nasc-team/daily
	sudo apt-get -y update
	sudo apt-get -y install nasc
	notify-send -i utilities-terminal elementary-script "NaSC installed successfully!"
fi

# Install Pinta Action
if [[ $GUI == *"Install Pinta"* ]]
then
	clear
	echo "Installing Pinta..."
	echo ""
	sudo add-apt-repository -y ppa:pinta-maintainers/pinta-stable
	sudo apt-get -y update
	sudo apt-get -y install pinta
	notify-send -i utilities-terminal elementary-script "Pinta installed successfully!"
fi

# Install MyPaint Action
if [[ $GUI == *"Install MyPaint"* ]]
then
	clear
	echo "Installing MyPaint..."
	echo ""
	sudo add-apt-repository -y ppa:achadwick/mypaint-testing
	sudo apt-get -y update
	sudo apt-get -y install mypaint mypaint-data-extras
	notify-send -i utilities-terminal elementary-script "MyPaint installed successfully!"
fi

# Install SmartGit Action
if [[ $GUI == *"Install SmartGit"* ]]
then
	clear
	echo "Installing SmartGit..."
	echo ""
	sudo add-apt-repository -y ppa:eugenesan/ppa
	sudo apt-get -y update
	sudo apt-get -y install smartgit
	notify-send -i utilities-terminal elementary-script "SmartGit installed successfully!"
fi

# Install Spotify Action
if [[ $GUI == *"Install Spotify"* ]]
then
	clear
	echo "Installing Spotify - input will we required"
	echo ""
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt-get -y update
	sudo apt-get -y install spotify-client
	notify-send -i utilities-terminal elementary-script "Spotify installed successfully!"
fi

# Install Tomato Action
if [[ $GUI == *"Install Tomato"* ]]
then
	clear
	echo "Installing Tomato..."
	echo ""
	sudo add-apt-repository -y ppa:tomato-team/tomato-stable
	sudo apt-get -y update
	sudo apt-get -y install tomato
	notify-send -i utilities-terminal elementary-script "Tomato installed successfully!"
fi

# Install Go For It! Action
if [[ $GUI == *"Install Go For It!"* ]]
then
	clear
	echo "Installing Go For It!..."
	echo ""
	sudo add-apt-repository -y "ppa:mank319/go-for-it"
	sudo apt-get -y update
	sudo apt-get -y install "go-for-it"
	notify-send -i utilities-terminal elementary-script "Go For It! installed successfully!"
fi

# Install Vocal Action
if [[ $GUI == *"Install Vocal"* ]]
then
	clear
	echo "Installing Vocal..."
	echo ""
	sudo add-apt-repository -y ppa:nathandyer/vocal-daily
	sudo apt-get -y update
	sudo apt-get -y install vocal
	notify-send -i utilities-terminal elementary-script "Vocal installed successfully!"
fi

# Install Footnote Action
if [[ $GUI == *"Install Footnote"* ]]
then
	clear
	echo "Installing Footnote..."
	echo ""
	sudo add-apt-repository -y ppa:elementary-os/daily
	sudo apt-get -y update
	sudo apt-get -y install footnote
	sudo add-apt-repository -y --remove ppa:elementary-os/daily
	sudo apt-get -y update
	notify-send -i utilities-terminal elementary-script "Footnote installed successfully!"
fi

# Install Relay Action
if [[ $GUI == *"Install Relay"* ]]
then
	clear
	echo "Installing Relay..."
	echo ""
	sudo apt-add-repository -y ppa:agronick/relay
    sudo apt-get -y update
    sudo apt-get -y install relay
	notify-send -i utilities-terminal elementary-script "Relay installed successfully!"
fi

# Install Skype Action
if [[ $GUI == *"Install Skype"* ]]
then
	clear
	echo "Installing Skype..."
	echo ""
	sudo apt-get -y install skype
	sudo apt-get -y install qt4-qtconfig
	notify-send -i utilities-terminal elementary-script "Skype installed successfully!"
fi

# Install Telegram Action
if [[ $GUI == *"Install Telegram"* ]]
then
	clear
	echo "Installing Telegram..."
	echo ""
	sudo apt-add-repository -y ppa:atareao/telegram
    sudo apt-get -y update
    sudo apt-get -y install telegram
	notify-send -i utilities-terminal elementary-script "Telegram installed successfully!"
fi

# Install Imgur contract Action
if [[ $GUI == *"Install Imgur contract"* ]]
then
	clear
	echo "Installing Imgur contract..."
	echo ""
	sudo add-apt-repository -y ppa:cybre/imgurcontract
	sudo apt-get -y update
	sudo apt-get -y install imgur-contract
	notify-send -i utilities-terminal elementary-script "Imgur contract installed successfully!"
fi

# Install Hourglass Action
if [[ $GUI == *"Install Hourglass"* ]]
then
	clear
	echo "Installing Hourglass..."
	echo ""
	sudo add-apt-repository -y ppa:hourglass-team/hourglass-daily
	sudo apt-get -y update
	sudo apt-get -y install hourglass
	notify-send -i utilities-terminal elementary-script "Hourglass installed successfully!"
fi

# Install Steam Action
if [[ $GUI == *"Install Steam"* ]]
then
	clear
	echo "Installing Steam - input will be required"
	echo ""
	sudo apt-get -y install steam
	notify-send -i utilities-terminal elementary-script "Steam installed successfully!"
fi

# Install Ubuntu make Action
if [[ $GUI == *"Install Ubuntu make"* ]]
then
	clear
	echo "Installing Ubuntu make..."
	echo ""
	sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
	sudo apt-get -y update
	sudo apt-get -y install ubuntu-make
	notify-send -i utilities-terminal elementary-script "Ubuntu make installed successfully!"
fi

# Install Record my Desktop Action
if [[ $GUI == *"Install Record my Desktop"* ]]
then
	clear
	echo "Installing Record my Desktop..."
	echo ""
	sudo apt-get -y install recordmydesktop
	notify-send -i utilities-terminal elementary-script "Record my Desktop installed successfully!"
fi

# Install Simple screen recorder Action
if [[ $GUI == *"Install Simple screen recorder"* ]]
then
	clear
	echo "Installing Simple screen recorder..."
	echo ""
	sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
	sudo apt-get -y update
	sudo apt-get -y install simplescreenrecorder
	notify-send -i utilities-terminal elementary-script "Simple screen recorder installed successfully!"
fi
 
# Install Cheese Action
if [[ $GUI == *"Install Cheese"* ]]
then
	clear
	echo "Installing Cheese..."
	echo ""
	sudo apt-get -y install cheese
	notify-send -i utilities-terminal elementary-script "Cheese installed successfully!"
fi

# Install Gnome media recorder Action
if [[ $GUI == *"Install Gnome media recorder"* ]]
then
	clear
	echo "Installing Gnome media recorder..."
	echo ""
	sudo apt-get -y install gnome-media
	notify-send -i utilities-terminal elementary-script "Gnome media recorder installed successfully!"
fi

# Install Trimage Action
if [[ $GUI == *"Install Trimage"* ]]
then
	clear
	echo "Installing Trimage..."
	echo ""
	sudo apt-get -y install trimage
	notify-send -i utilities-terminal elementary-script "Trimage installed successfully!"
fi

# Install GPick Action
if [[ $GUI == *"Install GPick"* ]]
then
	clear
	echo "Installing Trimage..."
	echo ""
	sudo apt-get -y install gpick
	notify-send -i utilities-terminal elementary-script "GPick installed successfully!"
fi

# Fix Broken Packages Action
if [[ $GUI == *"Fix Broken Packages"* ]]
then
	clear
	echo "Fixing the broken packages..."
	echo ""
	sudo apt-get -y -f install
	notify-send -i utilities-terminal elementary-script "Fixing the broken packages ran successfully!"
fi

# Clean-Up Junk Action
if [[ $GUI == *"Clean-Up Junk"* ]]
then
	clear
	echo "Cleaning-up junk..."
	echo ""
	sudo apt-get -y autoremove
	sudo apt-get -y autoclean
	notify-send -i utilities-terminal elementary-script "Cleaning-up junk ran successfully!"
fi

# Post-install system update Action
if [[ $GUI == *"Post-install system update"* ]]
then
	clear
	echo "Post-install system update..."
	echo ""
	sudo apt-get -y update
	sudo apt-get -y upgrade
	notify-send -i utilities-terminal elementary-script "Post-install system update ran successfully!"
fi


# Notification & exit
clear
echo "All tasks ran successfully!"
notify-send -i utilities-terminal elementary-script "All tasks ran successfully!"
sleep 2
exit 0


#Indicator Workspaces
#Indicator Terminal

#Lollypop music player
#Corebird
#eRadio
#Piviti

#Replace combine

#Wine + Play on linux
#Unetbootin
#Typhoon
#Thunderbird
#TeamViewer
#Strem.io
#TeamSpeak
#Plex Home Theater
#My Weather Indicator
#Grive tools
#Grub customizer
#Gparted
#Dukto
#Clementine
#Brackets
#Umake ides all
#Viber
#OS X fonts
#OBS studio
#Lightworks
#Hulu
#handbrake
#veracrypt
#conky
#aptik

#other themes?
#https://github.com/Havoqq/elementary-script/blob/master/elementary-script.sh
