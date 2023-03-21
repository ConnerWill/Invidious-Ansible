# Invidious Ansible

[![deploy](https://github.com/ConnerWill/Invidious-Ansible/actions/workflows/deploy-invidious.yml/badge.svg)](https://github.com/ConnerWill/Invidious-Ansible/actions/workflows/deploy-invidious.yml)

Ansible playbooks to deploy [Invidious][invidious]

***Currently a work in progress***

# Supported OS Families

* Arch *(Arch, Manjaro)*
* Debian *(Debian, Ubuntu)*
* RedHat *(RHEL, CentOS, Rocky)*


# Setup

Create SSH key

```bash
ssh-keygen -t ed25519 -a 256 -C "Invidious" -f ~/.ssh/invidious-ssh-key
```

Copy SSH key to server

```bash
ssh-copy-id -i ~/.ssh/invidious-ssh-key user@server
```

Copy inventory example to inventory file

```bash
cp ./EXAMPLE-inventory.yml ./inventory.yml
```

Edit inventory file *(`inventory.yml`)*

```bash
vim ./inventory.yml
```

Edit variables file *(`vars/all.yml`)*

```bash
vim ./vars/all.yml
```


# Usage


Deploy Invidious using `invidious-ansible.sh` script

```bash
./invidious-ansible.sh deploy inventory.yml
```

Deploy Invidious using `ansible-playbook` command

```bash
ansible-playbook -i ./inventory.yml ./playbooks/deploy-invidious.yml
```

Show help and available actions in `invidious-ansible.sh` script

```bash
./invidious-ansible.sh help
```

<!---
Deploy Invidious with Docker Compose

```bash
ansible-playbook -i ./inventory.yml ./playbooks/docker-compose-invidious.yml
```
--->

# Playbooks

Playbooks are located under the `playbooks` directory

`deploy-invidious.yml`
: Deploy Invidious to a new server

`update-invidious.yml`
: Update an existing installation of Invidious

`docker-compose-deploy-invidious.yml`
: Deploy Invidious using Docker Compose



<!-- LINKS -->
[github-repo]: https://github.com/ConnerWill/invidious-ansible
[github-top-language-badge]: https://img.shields.io/github/languages/top/ConnerWill/invidious-ansible
[github-language-count-badge]: https://img.shields.io/github/languages/count/ConnerWill/invidious-ansible
[github-last-commit-badge]: https://img.shields.io/github/last-commit/ConnerWill/invidious-ansible
[github-commits]: https://github.com/ConnerWill/invidious-ansible/commits/main
[github-issues-badge]: https://img.shields.io/github/issues-raw/ConnerWill/invidious-ansible
[github-issues]: https://github.com/ConnerWill/invidious-ansible/issues
[github-repo-size-badge]: https://img.shields.io/github/repo-size/ConnerWill/invidious-ansible
[gitlab-badge]: https://img.shields.io/static/v1?label=gitlab&logo=gitlab&color=E24329&message=mirrored
[gitlab]: https://gitlab.com/ConnerWill/invidious-ansible
[license-badge]: https://img.shields.io/github/license/ConnerWill/invidious-ansible
[license]: https://github.com/ConnerWill/invidious-ansible/blob/main/docs/LICENSE
[github-repo-stars-badge]: https://img.shields.io/github/stars/ConnerWill/invidious-ansible?style=social

[invidious]: https://docs.invidious.io
[invidious-install]: https://docs.invidious.io/installation
[invidious-repo]: https://github.com/iv-org/invidious
