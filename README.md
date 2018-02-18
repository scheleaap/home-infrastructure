# Notes

## Preparation

On the Raspberry Pi:

1. Enable ssh:
  ```
  sudo systemctl enable ssh
  sudo systemctl start ssh
  ```
2. Create SSH directory:
  ```
  cd ~
  install -d -m 700 ~/.ssh
  ```
3. Force audio through 3.5 mm jack: `sudo raspi-config`

On another machine:

1. Copy public key to authorized_keys:
  ```
  cat ~/.ssh/id_rsa.pub | ssh pi@framboos 'cat >> .ssh/authorized_keys'
  ```

## Docker

### Installation

```
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

## Molecule

### Installation

```
sudo apt-get update && sudo apt-get install gcc python-pip libssl-dev libffi-dev virtualenv && \
virtualenv . && \
source bin/activate && \
pip install ansible && \
pip install docker && \
pip install python-vagrant && \
pip install molecule==1.24.0
```

### Development

```sh
cd src/roles/mopidy
molecule test
```

In the container:
```sh
nohup /usr/bin/mopidy --config /etc/mopidy/mopidy.conf &
```

Useful commands:

docker exec -it mopidy bash
apt-cache madison mopidy


## Running it

```sh
ansible-galaxy install -r requirements.yml -p roles/
ansible-playbook site.yml -i hosts
# --ask-vault-pass
```
