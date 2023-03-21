#!/bin/env bash

ACTION="${1}"
INVENTORY="${2}"


## Check action input
case "${ACTION}" in
  dep*)
    playbook="deploy-invidious.yml"
    ;;
  upd*)
    playbook="update-invidious.yml"
    ;;
  unin*)
    playbook="uninstall-invidious.yml"
    ;;
  *)
    echo "INVALID ACTION !!!"
    ;;
esac


if [[ -z "${INVENTORY}" ]]; then
  printf "PLEASE SPECIFY AN INVENTORY FILE\n"
else
  if [[ ! -f "${INVENTORY}" ]]; then
    printf "Cannot find inventory file:\t%s\n" "${INVENTORY}"
  fi
fi

echo ansible-playbook -i "${INVENTORY}" "./playbooks/${playbook}"
