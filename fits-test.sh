#!/bin/sh
FITS_VERSION=1.3.0

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
fi
