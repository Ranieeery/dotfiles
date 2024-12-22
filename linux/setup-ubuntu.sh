#!/bin/bash

# Instalação de dependências
sudo apt update -y

# Configuração do Git
sudo apt install git -y
git config --global user.name "Ranieeery"
git config --global user.email "raniery2003@hotmail.com"
git config --global init.defaultBranch main

# Instalação do Grub
sudo apt-get install grub2 -y
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo apt-get update -y
sudo apt-get install grub-customizer -y
sudo update-grub

# Instalar programas externos .deb
mkdir -p ~/Downloads/Programas
cd ~/Downloads/Programas
sudo dpkg -i *.deb

# Instalar o snapd e curl
sudo apt install -y snapd
sudo apt install -y curl

# Instalar Spotify, Flatpak e Discord via Flatpak
sudo snap install spotify
sudo apt install flatpak -y
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord -y

# Instalar Brave Browser via Flatpak
flatpak install flathub com.brave.Browser -y
flatpak run com.brave.Browser

# Instalar Visual Studio Code e IntelliJ IDEA Ultimate via Flatpak
flatpak install flathub com.visualstudio.code -y
flatpak run com.visualstudio.code
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Ultimate -y
flatpak run com.jetbrains.IntelliJ-IDEA-Ultimate

# Instalar Steam via Flatpak
flatpak install flathub com.valvesoftware.Steam -y
flatpak run com.valvesoftware.Steam

# Instalar OpenJDK 17, Node.js e Yarn
sudo apt install -y openjdk-17-jdk nodejs npm
sudo npm install -g n
sudo n lts
npm install --global yarn

# Instalar Docker
sudo apt remove docker-desktop
rm -r $HOME/.docker/desktop
sudo rm /usr/local/bin/com.docker.cli
sudo apt purge docker-desktop

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg
    
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

echo "https://docs.docker.com/desktop/install/ubuntu/"

# Instalar Zsh e Oh My Zsh
sudo apt install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo 'Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc, and source ~/.zshrc'
chsh -s $(which zsh)

# Continuação Grub
echo "sudo nano /etc/default/grub and set GRUB_DISABLE_OS_PROBER=false"
echo "sudo apt-get install os-prober"

# Limpar travas do APT, se necessário
# sudo rm /var/lib/dpkg/lock-frontend
# sudo rm /var/cache/apt/archives/lock
