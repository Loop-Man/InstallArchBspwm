#!/bin/bash
# Descargar ISO de arch, usar archinstall y seleccionar el desktop de bspwm y sxhkd.
# Al iniciar por primera vez al no tener los ficheros bspwmrc y sxhkdrc necesitamos abrir una terminal virtual: ctrl + alt + F2 o F3

# Virtual box utils
sudo pacman -Syu
#sudo pacman -S --noconfirm --needed virtualbox-guest-utils
#sudo systemctl enable vboxservice.service
#sudo systemctl start vboxservie.service

# Instalación core
sudo pacman -S --noconfirm --needed kitty # Terminal y con crt + shift + Enter podemos hacer como con tmux.
sudo pacman -S --noconfirm --needed polybar # Polybar
sudo pacman -S --noconfirm --needed picom # Gestor de transparencia en la terminal y aplicaciones.
sudo pacman -S --noconfirm --needed rofi # Lanzador de aplicaciones
sudo pacman -S --noconfirm --needed feh # Manejar fondos de pantalla
sudo pacman -S --noconfirm --needed dash ## Para el script de resize

## Instalar zsh, lsd y bat
sudo pacman -S --noconfirm --needed zsh # zsh shell       
sudo pacman -S --noconfirm --needed lsd # ls powered
sudo pacman -S --noconfirm --needed bat # cat beautiful

## Instalar imagemagick para poder ver imagenes y tratarlas en la terminal kitty
## kitty +kitten icat gato.webp (para verlo en la terminal)
sudo pacman -S --noconfirm --needed imagemagick

## Instalar parte gráfica (necesario para picom)
sudo pacman -S --noconfirm --needed mesa mesa-utils mesa-demos nvidia nvidia-utils libglvnd

## Instalar gestor de archivos
sudo pacman -S --noconfirm --needed thunar

## Instalar yay y fuente de la terminal
sudo pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -Syu --noconfirm --needed
yay -S --noconfirm --needed ttf-hack-nerd

## Instalar plugins recomendados zsh, oh-my-zsh y fzf

sudo pacman -S --noconfirm --needed zsh-autosuggestions
sudo pacman -S --noconfirm --needed zsh-syntax-highlighting
sudo pacman -S --noconfirm --needed zsh-doc
sudo pacman -S --noconfirm --needed zsh-lovers
sudo pacman -S --noconfirm --needed zsh-history-substring-search
sudo pacman -S --noconfirm --needed zsh-completions
sudo pacman -S --noconfirm --needed zshdb
sudo pacman -S --noconfirm --needed fzf
yay -S --noconfirm --needed zsh-autocomplete
yay -S --noconfirm --needed oh-my-zsh-git 

## Finalizada la instalación core vamos a copiar los archivos de configuración:
cd ~
git clone https://github.com/Loop-Man/InstallArchBspwm.git
cd InstallArchBspwm
cp -r .config/* ~/.config/
cp .zshrc ~/
sudo cp burpsuite-launcher /usr/bin/
cd ~
## En ~/.config/bspwm/scripts/ modificar el ethernet_status.sh con la interfaz de red que sea.#####

## Configurar la polybar
## Procedimiento primera vez:
#git clone https://github.com/VaughnValle/blue-sky.git ~/.config/blue-sky
#mkdir -p /usr/share/fonts/truetype
#mkdir ~/.config/polybar
#cd ~/Downloads/blue-sky/polybar
#cp * -r ~/.config/polybar
#echo '~/.config/polybar/./launch.sh' >> ~/.config/bspwm/bspwmrc
#cd fonts
#sudo cp * /usr/share/fonts/truetype/
#cd
## En .config/polybar copiar el launch.sh, current.ini y workspace.ini modificados.

## Procedimiento con los archivos de configuración ya copiados a su directorio anteriormente:
sudo mkdir -p /usr/share/fonts/truetype && sudo cp -r ~/.config/polybar/fonts/* /usr/share/fonts/truetype/
fc-cache -fv

## Neovim y nvchad
yay -S --noconfirm --needed neovim
git clone https://github.com/NvChad/starter ~/.config/nvim
# Manualmente ejecutar nvim cuando queramos inicializarlo con esta configuración de nvchad. Ejecutar :MasonInstallAll la primera vez que ejecutemos.
# Dentro de nvim si pulsamos ESC + espacio + t + h uno a uno nos sale el selector de temas. espacio + c + h --> cheatsheet.
#yay -S --noconfirm --needed nvchad-git (No funciona de momento).

## Para los temas de rofi.
git clone https://github.com/newmanls/rofi-themes-collection.git && mkdir -p ~/.config/rofi/themes && cp -r rofi-themes-collection/themes/* ~/.config/rofi/themes/ && rm -rf rofi-themes-collection
## Usamos el comando rofi-theme-selector y alt + a para confirmar el que nos guste.

## Para i3lock y i3lock
yay -S --noconfirm --needed i3lock-fancy

## Cambiar shell a zsh
sudo usermod --shell /usr/bin/zsh user
sudo usermod --shell /usr/bin/zsh root

## Enlaces simbólicos para root.
SOURCE_DIR="/home/$(whoami)/InstallArchBspwm/.config"
DEST_DIR="/root/.config"
#for folder in "$SOURCE_DIR"/*; do if [ -d "$folder" ]; then echo "Carpeta encontrada: $(basename "$folder")"; fi; done
sudo mkdir -p /root/.config
for folder in "$SOURCE_DIR"/*; do if [ -d "$folder" ]; then folder_name=$(basename "$folder") && sudo rm -rf "$DEST_DIR/$folder_name" && sudo ln -s "/home/$(whoami)/.config/$folder_name" "$DEST_DIR/$folder_name" && echo "Enlace creado: $DEST_DIR/$folder_name -> /home/$(whoami)/.config/$folder_name"; fi; done
sudo rm -rf /root/.zshrc && sudo ln -s ~/.zshrc /root/.zshrc

## Utilidades
sudo pacman -S --noconfirm --needed plocate ## Para instalar locate en arch
sudo pacman -S --noconfirm --needed net-tools ## Para utilidades de red como ifconfig
sudo pacman -S --noconfirm --needed firefox ## Navegador
sudo pacman -S --noconfirm --needed tree ## Para desplegar directorios.
sudo pacman -S --noconfirm --needed code ## Para visual studio code.
sudo pacman -S --noconfirm --needed ranger ## Para navegación por carpetas desde terminal.
sudo pacman -S --noconfirm --needed python3 
sudo pacman -S --noconfirm --needed python-pip
yay -S --noconfirm --needed python2
#yay -S --noconfirm --needed python2-pip (No funciona)
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && python2 get-pip.py && rm -rf get-pip.py
