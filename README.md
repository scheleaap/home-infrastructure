# Configuration for Home Computers

## Preparation

### Master Machine

Go to the target directory and run:

```bash
# Install pip3 and pipenv (needed only once)
sudo apt purge python-pip && \
sudo apt install python3-pip && \
pip3 install --user pipenv

# Create venv and activate
PATH=~/.local/bin:$PATH && \
pipenv --three && \
pipenv shell

# Install project dependencies
pipenv update
```


### All Target Machines

1. Create SSH directory:
   ```bash
   cd ~
   install -d -m 700 ~/.ssh
   ```

1. **Run from another machine:**<br>
   Copy public key to authorized_keys:
   ```bash
   cat ~/.ssh/id_rsa.pub | ssh <user>@<host> 'cat >> .ssh/authorized_keys'
   ```


### Raspberry Pi

1. Execute `sudo raspi-config` to setup keyboard, locale, hostname, etc.

1. Enable ssh:
   ```bash
   sudo systemctl enable ssh
   sudo systemctl start ssh
   ```

1. Force audio through 3.5 mm jack: `sudo raspi-config`


## Running It

1. Define all secrets (`vault` files)
2. ```bash
   pipenv shell
   ansible-galaxy install -r requirements.yml -p roles/
   ansible-playbook site.yml -i hosts
   # --ask-vault-pass
   # --ask-become-pass
   ```


## Ansible Role Development

### Docker Installation

```bash
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    sshpass
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update && sudo apt-get install docker-ce
sudo usermod -a -G docker $(whoami)
```

### Molecule Installation

```bash
sudo apt-get update && \
sudo apt-get install gcc python-pip libssl-dev libffi-dev virtualenv && \
virtualenv . && \
source bin/activate && \
pip install ansible && \
pip install docker && \
pip install python-vagrant && \
pip install molecule==1.25.0
```

### Testing a role
```bash
cd src/roles/mopidy
molecule test
```

In the container:
```bash
nohup /usr/bin/mopidy --config /etc/mopidy/mopidy.conf &
```

Useful commands:
```bash
docker exec -it mopidy bash
apt-cache madison mopidy
```
