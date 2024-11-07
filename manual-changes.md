# Manual changes

## `scheleaapub`

```sh
sudo apt install nomacs gthumb totem
```

```sh
snap install 
```

```sh
git clone git@github.com:scheleaap/ansible-role-env-common.git
git clone git@github.com:scheleaap/ansible-role-env-desktop.git
git clone git@github.com:scheleaap/ansible-role-raspberrypi.git
git clone git@github.com:scheleaap/ansible-role-rfid-jukebox.git
git clone git@github.com:scheleaap/ansible-role-raspotify.git   
git clone git@github.com:scheleaap/ansible-role-snapcast.git    
git clone git@github.com:scheleaap/ansible-role-mopidy.git      
git clone git@github.com:scheleaap/baederland-swimming-course-checker.git
```

```sh
ln -s ~/dev/ansible-role-env-common ~/dev/home-infrastructure/roles/env-common
ln -s ~/dev/ansible-role-env-desktop ~/dev/home-infrastructure/roles/env-desktop
ln -s ~/dev/ansible-role-mopidy ~/dev/home-infrastructure/roles/mopidy
ln -s ~/dev/ansible-role-snapcast roles/snapcast
ln -s ~/dev/ansible-role-rfid-jukebox ~/dev/home-infrastructure/roles/rfid-jukebox
ln -s ~/dev/ansible-role-raspotify ~/dev/home-infrastructure/roles/raspotify
ln -s ~/dev/ansible-role-raspberrypi ~/dev/home-infrastructure/roles/raspberrypi  
```

```sh
gsettings set org.gnome.desktop.interface font-name "Ubuntu 9" (9 @ home, 10 @ work)
gsettings set org.gnome.desktop.interface monospace-font-name "Ubuntu Mono 10" (10 @ home, 11 @ work)
gnome-extensions disable tiling-assistant@ubuntu.com
```
