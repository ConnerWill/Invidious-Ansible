# Invidious Ansible

Ansible playbooks to deploy Invidious

***Currently a work in progress***

# Supported OS

* Arch
* Debian
* Ubuntu
* CentOS

# Usage

Deploy Invidious

```bash
ansible-playbook -i ./inventory.yml ./playbooks/deploy-invidious.yml
```

Deploy Invidious with Docker Compose

```bash
ansible-playbook -i ./inventory.yml ./playbooks/docker-compose-invidious.yml
```
