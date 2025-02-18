# Home Infrastructure

This is an Ansible Playbook for my home infrastructure (mostly Raspberry Pi's, so far).


## Running it

_(See below for [setup instructions](#setup))_

1. Modify `hosts` and `site.yml` as appropriate.
1. Make sure you have defined all secrets: rename all `vault.yaml.default` files to `vault.yaml` and fill in the values as appropriate.
1. ```sh
   pipenv run ansible-galaxy collection install -r requirements.yml
   pipenv run ansible-galaxy install -r requirements.yml -p roles/
   pipenv run ansible-playbook site.yml -i hosts
   pipenv run ansible-playbook site.yml -i hosts -l framboos
   pipenv run ansible-playbook site.yml -i hosts -l media_center --tags raspotify
   # --ask-vault-pass
   # --ask-become-pass
   ```


## Setup

### Main machine

On the machine you would like to run this playbook on, run:

```sh
# Install pip3 and pipenv
sudo apt install python3-pip && \
pip3 install --user pipenv

# Create pipenv with installed dependencies
PATH=~/.local/bin:$PATH && \
pipenv && \
pipenv update

# If you use the default system Python
sudo apt install python3-debian
# If you use Pyenv
pip install python-debian
```


### Adding a new target machine

On every target machine you would like to mananage, execute the following steps:

1. _(Raspberry Pi only)_ Execute `sudo raspi-config` to setup keyboard, locale, hostname, etc.

1. _(Raspberry Pi only)_ Force audio through 3.5 mm jack: `sudo raspi-config`

1. _(Raspberry Pi only)_ Upgrade the firmware: `sudo rpi-update`

1. Install the SSH server:
   ```sh
   sudo apt install openssh-server
   ```

1. _(Optional, this might have been done already)_ Enable and start SSH:
   ```sh
   sudo systemctl enable ssh
   sudo systemctl start ssh
   ```

1. _(Optional, this might have been done already)_ Create SSH directory:
   ```sh
   cd ~
   install -d -m 700 ~/.ssh
   ```

1. **Run from the main machine:**<br>
   Copy public key to authorized_keys:
   ```sh
   ssh-copy-id <user>@<host>
   ```
   <!-- This is equivalent to: cat ~/.ssh/id_rsa.pub | ssh <user>@<host> 'cat >> .ssh/authorized_keys' -->

1. **Run from the main machine:**<br>
   _(Optional)_ Copy the public/private key pair:
   ```sh
   scp ~/.ssh/id_rsa* <user>@<host>:~/.ssh
   ```
