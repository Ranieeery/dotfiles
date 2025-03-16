sudo apt-get install grub2 -y
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo apt-get update -y
sudo apt-get install grub-customizer -y
sudo update-grub

echo "sudo nano /etc/default/grub and set GRUB_DISABLE_OS_PROBER=false"
echo "sudo apt-get install os-prober"