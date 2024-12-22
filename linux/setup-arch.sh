# Setup Arch Linux with Gnome
sudo pacman -Syu

sudo reboot

sudo pacman -S xorg xorg-server

sudo pacman -S gnome

sudo pacman -S gdm

pacman -Qs gdm

sudo systemctl enable --now gdm.service

sudo systemctl status gdm.service

# Install some packages to test
sudo pacman -S firefox nano

sudo reboot

# Install FastFetch
sudo pacman -S fastfetch
fastfetch

# Install gnome browser connector to install Dash to Dock extension
sudo pacman -S gnome-browser-conntector

# Setup minimize, maximize and close buttons on the left
gsettings set org.gnome.desktop.wm.preferences button-layout 'minimize,maximize,close:'

sudo pacman -S gnome-tweaks

sudo pacman -S flatpak

# Install Piper to configure mouse
pacman -S piper

# Install Yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install (nerd) fonts
sudo mv *.ttf /usr/share/fonts/ttf/
sudo fc-cache -f -v

# Alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python

cargo build --release
infocmp alacritty
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Install Zsh and Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting