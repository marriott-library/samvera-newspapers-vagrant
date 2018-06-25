#!/bin/sh
# This script will install the necessary environmental dependencies to run newspaper_works gem

echo "Installing Poppler Utilities"
apt-get -y install poppler-utils

echo "Installing Ghost Script"
apt-get -y install ghostscript

echo "Installing Libreoffice"
apt-get -y install libreoffice

echo "Installing Tesseract OCR"
apt-get -y installapt-get install tesseract-ocr

echo "Installing ImageMagick"
apt-get -y installapt-get install imagemagick
