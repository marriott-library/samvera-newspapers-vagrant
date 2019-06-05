###
# BASICS
###

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

cd

# Update
apt-get -y update && apt-get -y upgrade

# SSH
apt-get -y install openssh-server

# Build tools
apt-get -y install build-essential

# Git vim
apt-get -y install git vim

# Wget, curl and unzip
apt-get -y install wget curl unzip

# Are these necessary in 18.04? LTS
# Add BrightCove Ruby PPA
#sudo apt-add-repository ppa:brightbox/ruby-ng
#sudo apt-get update
