#!/bin/sh
HOME="/home/ubuntu"


echo "Creating Newspaper Works demo in ${HOME}/newspaper_works"
cd
git clone https://github.com/marriott-library/newspaper_works.git newspaper_works
cd newspaper_works
#/bundle install --quiet --path vendor/bundle
#rake engine_cart:generate
echo "Installation of Newspaper Works App complete..."
