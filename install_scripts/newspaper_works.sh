#!/bin/sh
HOME="/home/vagrant"

echo "Creating Newspaper Works demo in ${HOME}/newspaper_works"
cd ${HOME}
sudo -u vagrant git clone https://github.com/marriott-library/newspaper_works.git newspaper_works
cd newspaper_works
sudo -u vagrant bundle install # --quiet --path vendor/bundle
sudo -u vagrant rake engine_cart:generate
echo "Installation of Newspaper_Works is complete..."
