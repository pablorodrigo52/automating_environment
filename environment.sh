sudo apt-get update
echo 'installing curl' 
sudo apt install curl -y

#terminal theme
sudo apt-get install dconf-cli uuid-runtime -y

mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Mayccoll/Gogh.git gogh
cd gogh/themes
export TERMINAL=gnome-terminal
./dracula.sh
clear

# <GIT>
echo 'installing git' 
sudo apt install git -y
git config --global user.name "Pablo Rodrigo"
git config --global user.email "pablorodrigo552@gmail.com"
git config --global core.editor vim
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
code --install-extension dracula-theme.theme-dracula
code --install-extension PKief.material-icon-theme
code --install-extension esbenp.prettier-vscode
code --install-extension alexcvzz.vscode-sqlite
code --install-extension xabikos.JavaScriptSnippets
code --install-extension dbaeumer.vscode-eslint
code --install-extension ecmel.vscode-html-css
code --install-extension sneezry.watch-in-chrome
code --install-extension visualstudioexptteam.vscodeintellicode
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
# echo 'installing spotify' 
# snap install spotify
# </SPOTIFY>

# <CHROME>
echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
# </CHROME>

# <TEAMVIEWER>
# echo 'installing teamviewer'
# wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
# sudo apt install -y ./teamviewer_amd64.deb
# </TEAMVIEWER>

# <VLC>
echo 'installing vlc media player'
sudo snap install vlc
# </VLC>

# echo 'installing discord'
# wget "https://discordapp.com/api/download?platform=linux&format=deb" -O discord.deb
# sudo apt-get install -f
# sudo dpkg -i discord.deb

# <STEAM>
#echo 'instaling steam'
#sudo apt upgrade
#sudo apt-get install libc6-i386
#wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
#sudo dpkg -i steam_latest.deb
#sudo apt-get install -f
# </STEAM>

# <NODEJSv12.18>
echo 'installing Node'
sudo apt-get install nodejs -y
