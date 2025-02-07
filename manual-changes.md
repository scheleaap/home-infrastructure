# Manual changes

## `scheleaapub`

Zed: https://zed.dev/install.sh

Install fonts:
* Sabon (https://font.download/font/sabon)

Apt:
```sh
sudo apt install nomacs gthumb totem pandoc texlive-full wkhtmltopdf
```

Flatpak:
```sh
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub io.github.orontee.Argos
```

Add `wout` to `docker` group for sudoless access. Note: In the future, try setting up Docker in 'rootless' mode or use Podman.
```sh
sudo usermod -a -G docker wout
```

Development:
```sh
git clone git@github.com:scheleaap/ansible-role-env-common.git
git clone git@github.com:scheleaap/ansible-role-env-desktop.git
git clone git@github.com:scheleaap/ansible-role-mopidy.git
git clone git@github.com:scheleaap/ansible-role-raspberrypi.git
git clone git@github.com:scheleaap/ansible-role-raspotify.git
git clone git@github.com:scheleaap/ansible-role-rfid-jukebox.git
git clone git@github.com:scheleaap/ansible-role-snapcast.git
git clone git@github.com:scheleaap/baederland-swimming-course-checker.git
```

```sh
ln -s ~/dev/ansible-role-env-common ~/dev/home-infrastructure/roles/env-common
ln -s ~/dev/ansible-role-env-desktop ~/dev/home-infrastructure/roles/env-desktop
ln -s ~/dev/ansible-role-mopidy ~/dev/home-infrastructure/roles/mopidy
ln -s ~/dev/ansible-role-raspberrypi ~/dev/home-infrastructure/roles/raspberrypi
ln -s ~/dev/ansible-role-raspotify ~/dev/home-infrastructure/roles/raspotify
ln -s ~/dev/ansible-role-rfid-jukebox ~/dev/home-infrastructure/roles/rfid-jukebox
ln -s ~/dev/ansible-role-snapcast ~/dev/home-infrastructure/roles/snapcast
```

Fonts:
```sh
gsettings set org.gnome.desktop.interface font-name "Ubuntu 9" (9 @ home, 10 @ work)
gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Mono 10" (10 @ home, 11 @ work)
gnome-extensions disable tiling-assistant@ubuntu.com
```
