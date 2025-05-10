USAR EFI

loadkeys br-abnt2

timedatectl set-ntp true
timedatectl set-timezone America/Sao_Paulo
timedatectl status

lsblk # Ver disco

cfdisk /dev/sda
# EFI System - 1G
# Linux swap - Min 4G
# Linux filesystem - resto

mkfs.fat -F32 /dev/sda1  # EFI
mkswap /dev/sdX2         # swap
swapon /dev/sdX2         # Ativa a swap imediatamente

mkfs.ext4 /dev/sdX3
mount /dev/sdX3 /mnt
mount --mkdir /dev/sdX1 /mnt/boot/efi

# Mirrors
sudo pacman -Sy
sudo pacman -S reflector rsync
sudo reflector --country Brazil --protocol https --age 12 --sort rate --latest 6 --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

pacstrap -K /mnt base base-devel linux-zen linux-firmware vim networkmanager git
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
locale-gen
vim /etc/locale.gen 
# Descomentar en_US.UTF-8 UTF-8 #:wq

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf

echo "archlinux" > /etc/hostname
vim  /etc/hosts
# 127.0.0.1   localhost
# ::1         localhost
# 127.0.1.1   archlinux.localdomain  archlinux

passwd
useradd -m -G wheel -s /bin/bash raniery
passwd raniery

pacman -S sudo
visudo
# Descomentar # %wheel ALL=(ALL:ALL) ALL

pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl reboot

sudo systemctl enable --now NetworkManager
nmcli device status

# Se Wi-fi
nmcli device wifi list 
sudo nmcli device wifi connect "Nome_da_Rede" password "Sua_Senha"

sudo pacman -Syu

lspci | grep -e VGA -e 3D

# Intel: 
sudo pacman -S mesa
# AMD:
sudo pacman -S mesa xf86-video-amdgpu vulkan-radeon

# NVIDIA: 
sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings
	# Para Wayland/Hyprland NVIDIA:
	sudo vim /etc/default/grub
	# GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia_drm.modeset=1"
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	systemctl reboot

sudo pacman -S hyprland wayland xorg-xwayland qt5-wayland qt6-wayland glfw-wayland pipewire wireplumber pipewire-pulse pipewire-alsa xdg-desktop-portal-hyprland

sudo pacman -S alacritty waybar wofi mako hyprpaper grim slurp brightnessctl pamixer polkit-kde-agent qt5-graphicaleffects qt5-quickcontrols2 # pipewire-jack

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -S clipse

sudo pacman -S ttf-jetbrains-mono ttf-font-awesome noto-fonts noto-fonts-emoji noto-fonts-cjk

sudo pacman -S sddm
sudo systemctl enable sddm

mkdir -p ~/.config/hypr
cp /usr/share/hypr/hyprland.conf ~/.config/hypr # pacman -Ql hyprland | grep hyprland.conf

reboot