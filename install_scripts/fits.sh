#!/bin/sh

# FITS
SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -d fits-$FITS_VERSION ]; then
  DOWNLOAD_URL="https://brussels.lib.utah.edu/FITS/fits-${FITS_VERSION}.zip"
  cd $DOWNLOAD_DIR
  if [ ! -f "fits.zip" ]; then
    curl $DOWNLOAD_URL -o fits.zip
  fi
  unzip fits.zip
  chmod a+x fits-$FITS_VERSION/*.sh
  FITS_PATH="${DOWNLOAD_DIR}/fits-${FITS_VERSION}"
  cd
  echo "PATH=\${PATH}:$FITS_PATH" >> .bashrc
  sudo ln -s /vagrant/downloads/fits-$FITS_VERSION/fits.sh /usr/bin/fits.sh

fi
