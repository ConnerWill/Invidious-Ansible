#!/bin/env bash
#vim:filetype=sh:shiftwidth=2:softtabstop=2:expandtab:foldmethod=marker:foldmarker=###{{{,###}}}
#shellcheck disable=2059

function invidious_ansible(){

  ACTION="${1}"
  INVENTORY="${2}"

  ###{{{ COLORS

  ## Check if 'NO_COLOR' environment variable is defined
  ## if 'NO_COLOR' is defined, do not define color array
  NO_COLOR=${NO_COLOR:-""}
  if [[ -n ${NO_COLOR} ]]; then
    declare -A colors
    colors[ColorOff]='\x1B[0m'
    colors[bold]=''
    colors[italic]=''
    colors[underline]=''
    colors[Black]=''
    colors[Gray]=''
    colors[DarkGray]=''
    colors[White]=''
    colors[Red]=''
    colors[Green]=''
    colors[Yellow]=''
    colors[Blue]=''
    colors[Purple]=''
    colors[Magenta]=''
    colors[Cyan]=''
    colors[BG_Black]=''
    colors[BG_Gray]=''
    colors[BG_DarkGray]=''
    colors[BG_White]=''
    colors[BG_Red]=''
    colors[BG_Green]=''
    colors[BG_Yellow]=''
    colors[BG_Blue]=''
    colors[BG_Purple]=''
    colors[BG_Magenta]=''
    colors[BG_Cyan]=''
    colors[reset]='\x1B[0m'
  else
    declare -A colors
    colors[ColorOff]='\x1B[0m'
    colors[bold]='\x1B[1m'
    colors[italic]='\x1B[3m'
    colors[underline]='\x1B[4m'
    colors[Black]='\x1B[38;5;0m'
    colors[Gray]='\x1B[38;5;245m'
    colors[DarkGray]='\x1B[38;5;8m'
    colors[White]='\x1B[38;5;15m'
    colors[Red]='\x1B[38;5;196m'
    colors[Green]='\x1B[38;5;46m'
    colors[Yellow]='\x1B[38;5;190m'
    colors[Blue]='\x1B[38;5;33m'
    colors[Purple]='\x1B[38;5;93m'
    colors[Magenta]='\x1B[38;5;201m'
    colors[Cyan]='\x1B[38;5;87m'
    colors[BG_Black]='\x1B[48;5;0m'
    colors[BG_Gray]='\x1B[48;5;245m'
    colors[BG_DarkGray]='\x1B[48;5;8m'
    colors[BG_White]='\x1B[48;5;15m'
    colors[BG_Red]='\x1B[48;5;196m'
    colors[BG_Green]='\x1B[48;5;46m'
    colors[BG_Yellow]='\x1B[48;5;190m'
    colors[BG_Blue]='\x1B[48;5;33m'
    colors[BG_Purple]='\x1B[48;5;93m'
    colors[BG_Magenta]='\x1B[48;5;201m'
    colors[BG_Cyan]='\x1B[48;5;87m'
    colors[reset]='\x1B[0m'
  fi

  ###}}} COLORS

  ###{{{ MESSAGES

   _msg_verbose(){ printf "${colors[White]}${colors[BG_Blue]} VERBOSE ${colors[reset]} ${colors[Blue]}%s${colors[reset]}\n" "${@}" ; }
   _msg_error(){ printf "${colors[White]}${colors[BG_Red]}  ERROR  ${colors[reset]} ${colors[Red]}%s${colors[reset]}\n" "${@}" ; }
   _msg_warning(){ printf "${colors[Black]}${colors[BG_Yellow]} WARNING ${colors[reset]} ${colors[Yellow]}%s${colors[reset]}\n" "${@}" ; }
   _msg_success(){ printf "${colors[Black]}${colors[BG_Green]} SUCCESS ${colors[reset]} ${colors[Green]}%s${colors[reset]}\n" "${@}" ; }

  ###}}} MESSAGES

  ###{{{ HELP

  HELP='HELP
  ACTIONS

    deploy    : Deploy a new installation of Invidious

    update    : Update an existing installation of Invidious

    uninstall : Uninstall Invidious

    help      : Show this help

  SYNTAX

    $  ./invidious-ansible.sh <action> [inventory]

  '

  ###}}} HELP

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
    h*)
      echo "${HELP}"
      return
      ;;
    *)
      _msg_error "Invalid Action"
      echo "${HELP}"
      return 1
      ;;
  esac


  if [[ -z "${INVENTORY}" ]]; then
    INVENTORY="inventory.yml"
    _msg_warning "No inventory file specified. Using '${INVENTORY}'"
  fi

  if [[ ! -f "${INVENTORY}" ]]; then
    _msg_error "Cannot find inventory file:  ${INVENTORY}"
    return 1
  fi

  ansible-playbook --check --diff -i "${INVENTORY}" "./playbooks/${playbook}"

}

invidious_ansible "${@}"
