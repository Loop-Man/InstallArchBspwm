# InstallArchBspwm

Este repositorio contiene mi configuración personalizada para Arch Linux con **BSPWM**, **SXHKD** y otras herramientas esenciales para un entorno productivo. También incluye un script de instalación (`install.sh`) que automatiza la configuración de mi sistema.

## Características

- Configuración de **BSPWM** y **SXHKD**.
- Instalación automática de herramientas esenciales como:
  - **Kitty** (terminal)
  - **Polybar** (barra de estado)
  - **Picom** (compositor)
  - **Rofi** (lanzador de aplicaciones)
  - **Feh** (gestor de fondos de pantalla)
  - **Neovim** con **NvChad**
- Configuración de **Zsh** como shell predeterminado con complementos como:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
  - `fzf` y más.
- Configuración de utilidades adicionales como **ranger**, **tree**, **plocate**, **firefox**, etc.
- Copia automática de los archivos de configuración desde el repositorio al sistema.
- Soporte para temas personalizados de **Rofi** y configuración de **i3lock-fancy**.
- Configuración de enlaces simbólicos para `root` y usuario.

## Requisitos previos

1. **Instalar Arch Linux:**
   - Descarga la ISO de Arch Linux y utiliza `archinstall` para configurar el sistema básico.
   - Selecciona el escritorio **BSPWM** y **SXHKD** durante la instalación.

2. **Abrir una terminal virtual la primera vez:**
   Si al iniciar no tienes configurados `bspwmrc` y `sxhkdrc`, abre una terminal virtual con `Ctrl + Alt + F2` o `F3`.

## Instrucciones de instalación

1. Clona este repositorio en tu directorio principal:
   ```bash
   git clone https://github.com/Loop-Man/InstallArchBspwm.git
   cd InstallArchBspwm
   ```

2. Ejecuta el script de instalación:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

3. Sigue las instrucciones adicionales en el script, como personalizar la interfaz de red en el script `ethernet_status.sh` y configurar la `polybar`.

## Configuración incluida

### **1. Archivos en `.config`:**
- **BSPWM**: Configuración del gestor de ventanas.
- **SXHKD**: Atajos de teclado personalizados.
- **Polybar**: Barra de estado con temas personalizados.
- **Picom**: Compositor para transparencias.
- **Rofi**: Temas para el lanzador de aplicaciones.

### **2. `.zshrc`:**
- Configuración personalizada para `zsh` con complementos instalados.

### **3. Instalación automática de programas:**
- **Terminal y utilidades de productividad**:
  - Kitty, Thunar, Ranger, Tree.
- **Desarrollo**:
  - Visual Studio Code, Python3, Python2.
- **Multimedia**:
  - Imagemagick.
- **Navegador**:
  - Firefox.

### **4. Neovim con NvChad:**
- Configuración avanzada para desarrollo con `Neovim` y el framework `NvChad`.

### **5. Rofi Temas:**
- Instalación automática de temas para personalizar `Rofi`.

## Personalización

1. **Modificar `ethernet_status.sh`:**
   - Cambia la interfaz de red según tu configuración.

2. **Configurar `polybar`:**
   - Los archivos `launch.sh`, `current.ini`, y `workspace.ini` deben estar en su lugar antes de ejecutar la barra.

3. **Cambiar la shell a `zsh`:**
   - Cambiar la shell predeterminada para el usuario y `root`:
     ```bash
     sudo usermod --shell /usr/bin/zsh user
     sudo usermod --shell /usr/bin/zsh root
     ```

4. **Enlaces simbólicos para `root`:**
   - Se crean automáticamente para que `root` use la configuración del usuario.

## Notas adicionales

- Usa `fc-cache -fv` después de configurar fuentes para asegurar que las fuentes personalizadas se detecten correctamente.
- Ejecuta manualmente `:MasonInstallAll` dentro de Neovim la primera vez para instalar las dependencias de `NvChad`.
- Usa `rofi-theme-selector` para elegir y aplicar un tema de `Rofi`.

---

## Licencia

Este repositorio se distribuye bajo la [MIT License](https://opensource.org/licenses/MIT).

---

## Contacto

Si tienes dudas o sugerencias, no dudes en abrir un issue en este repositorio.

