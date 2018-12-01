# Configuration for Home Computers

## Preparation

### Master Machine

1. Go to the target directory and run:
   ```bash
   sudo apt-get update && \
   sudo apt-get install python-pip virtualenv && \
   virtualenv . && \
   source bin/activate && \
   pip install ansible
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
   cat ~/.ssh/id_rsa.pub | ssh pi@framboos 'cat >> .ssh/authorized_keys'
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

```bash
source bin/activate
ansible-galaxy install -r requirements.yml -p roles/
ansible-playbook site.yml -i hosts
# --ask-vault-pass
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
pip install molecule==1.24.0
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
