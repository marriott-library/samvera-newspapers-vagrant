#!/bin/sh
# This script will install the necessary environmental dependencies to run newspaper_works gem

echo "Installing Depdencies for Newspaper_works"

PACKAGES="tesseract-ocr libreoffice ghostscript poppler-utils graphicsmagick"
sudo apt-get -y install $PACKAGES
