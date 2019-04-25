# This script checks if the dependencies passed as the arguments are available
# ans tries to install them if necessary.
# Globals:
#   none
# Options:
#   TODO(jason076): provide -h option
# Returns:
#   0: All requested programms are available 
#   1: Some or all requested programms are missing 
#######################################

# TODO(jason076): Add github link
# The library uses the libmgmt script by jason076

# Load libraries
  libmgmt__load io

#######################################
# Checks if the specified binary is installed.
# Globals:
#   none
# Arguments:
#   $1: binary name 
# Returns:
#   0: binary is available 
#   1: binary is not available 
#######################################


chkfor_bin() {
  if type $1 > /dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}

#######################################
# Checks if the specified package is installed. 
# Globals:
#   none
# Arguments:
#   $1: package name 
# Returns:
#   0: package is available 
#   1: package is not available 
#######################################

chkfor_pkg() {
  if apt list --installed | grep "$1/*" > /dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}
 
#######################################
# Installs a package.
# Globals:
#   none
# Arguments:
#   $1: Program name 
# Returns:
#   0: program installed succesfully 
#   1: failed installing the program 
#######################################

install() {
  # TODO(jonas): Use install directory as source to install packages that are not
  # available in standard package sources.
  try=0
  until type $1 > /dev/null 2>&1; do 
    if [ $try -eq 0 ]
    then
      try=1
      io__message "$1 is not available. Try to install it."
      sudo apt-get install $1 
    else 
      if io__yes_no "Failed to install $1. Do you want to retry?"
      then
          try=0
      else
          return 1 
      fi
    fi
  done

  return 0
}


main() {
  check=''

  while getopts 'b:p:B:P:' opt; do

    #determine check function
    case $opt in 
      b | B)
        check=chkfor_bin;;
      p | P)
        check=chkfor_pkg;;
    esac

    case $opt in 
      b | p)
        #single binary/package
        if [ 'check'  -ne 0 ]; then
            # dependency is not avaiable, try to install
            install "$OPTARG"
        fi ;;
      B | P)
        # multiple binaries/packages
        # Remove all already processed options from $@
        shift `expr ${OPTIND} - 1`

        # Treat all remaining arguments as binaries/packages
        for dep in "$@"; do
          # TODO(jason076): Maybe check if an illegal option is supplied after -B / -P
          if [ 'check' -ne 0 ]; then
            #dependency is not available, try to install
            install "${dep}"
        done
    esac
  done

  main "$@"
