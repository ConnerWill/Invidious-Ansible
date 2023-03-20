# Invidious Ansible

Ansible playbooks to deploy [Invidious][invidious]

***Currently a work in progress***

# Supported OS

* Arch
* Debian
* Ubuntu
* CentOS


# Setup

Create SSH key

```bash
ssh-keygen -t ed25519 -a 256 -C "Invidious" -f "~/.ssh/invidious-ssh-key"
```

Copy SSH key to server

```bash
ssh-copy-id -i ~/.ssh/invidious-ssh-key user@server
```

# Usage

Deploy Invidious

```bash
ansible-playbook -i ./inventory.yml ./playbooks/deploy-invidious.yml
```

Deploy Invidious with Docker Compose

```bash
ansible-playbook -i ./inventory.yml ./playbooks/docker-compose-invidious.yml
```







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