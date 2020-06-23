sudo apt-get update

echo 'installing curl' 
sudo apt install curl -y

# <GIT>
echo 'installing git' 
sudo apt install git -y

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Erick Wendel\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"erick.workspace@gmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'enabling workspaces for both screens' 
gsettings set org.gnome.mutter workspaces-only-on-primary false
# </GIT>

# <VS CODE>
echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders
echo 'installing extensions'
code --install-extension Dart-Code.dart-code
code --install-extension rocketseat.theme-omni
code --install-extension esbenp.prettier-vscode
code --install-extension vscjava.vscode-java-debug
code --install-extension Dart-Code.flutter
code --install-extension ecmel.vscode-html-css
code --install-extension xabikos.JavaScriptSnippets
code --install-extension PKief.material-icon-theme
code --install-extension sneezry.watch-in-chrome
# </VS CODE>

# <SUBLIME>
echo 'installing sublime'
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
#stable channel
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
# </SUBLIME>

# <SPOTIFY>
echo 'installing spotify' 
snap install spotify
# </SPOTIFY>

# <CHROME>
echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
# </CHROME>

# <TEAMVIEWER>
echo 'installing teamviewer'
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install -y ./teamviewer_amd64.deb
# </TEAMVIEWER>

# <VLC>
echo 'installing vlc media player'
sudo snap install vlc
# </VLC>

echo 'installing discord'
wget "https://discordapp.com/api/download?platform=linux&format=deb" -O discord.deb
sudo apt-get install -f
sudo dpkg -i discord.deb

# <STEAM>
#echo 'instaling steam'
#sudo apt upgrade
#sudo apt-get install libc6-i386
#wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
#sudo dpkg -i steam_latest.deb
#sudo apt-get install -f
# </STEAM>

# <NODEJSv12.18>
echo 'installing Node.v.12.18'
wget https://nodejs.org/dist/v12.18.0/node-v12.18.0-linux-x64.tar.xz
tar xf node-v12.18.0-linux-x64.tar.xz -C /opt
mv ~/node-v12.18.0-linux-x64 /opt/nodejs
echo 'setting ~/.bashrc'
echo 'export NODE_SDK=/opt/nodejs/bin' >> ~/.bashrc 
# </NODEJSv12>