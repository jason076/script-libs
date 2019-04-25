
# load libraries
libloader__load depmgt

#######################################
# Install WSL utilities 
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   0: Installation successfull
#   1: Installation failed
#######################################

wsl__install_wslu() {
  if type "wslupath" > /dev/null 2>&1; then
    # wlsu is already installed
    return 0
  else
    # wslu not installed
    needprog install apt-transport-https
    wget -O - https://api.patrickwu.ml/public.key | sudo apt-key add -

    grep "deb https://apt.patrickwu.ml/ stable main" /etc/apt/sources.list
    if [ $? -ne 0 ]; then
      # add to source liste if source does not exist
      echo "deb https://apt.patrickwu.ml/ stable main" | sudo tee -a /etc/apt/sources.list 
    fi

    sudo apt update
    sudo apt install wslu

    if [ $? -eq 0 ]; then
      return 0
    else
      return 1
    fi
  fi
}

#######################################
# Check if admin right are available for windows 
# Globals:
#   none 
# Arguments:
# Returns:
#   0: admin rights available
#   1: no admin rights
#######################################

wsl__is_winadmin() {
  if [ -w "`wslupath -W`" ]; then
    return 0;
  else
    return 1;
  fi
}
