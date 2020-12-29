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
