#!/bin/sh

echo "Setting up ruby environment"

# pre-requisites
PACKAGES="imagemagick libreadline-dev libyaml-dev libsqlite3-dev nodejs zlib1g-dev libsqlite3-dev redis-server"
sudo apt-get -y install $PACKAGES

# ruby and the development libraries (so we can compile nokogiri, kgio, etc)
sudo apt-get -y install ruby2.5 ruby2.5-dev

#gem install $GEMS --no-ri --no-rdoc
#sudo gem install bundler --no-ri --no-rdoc
#sudo gem install rails --version=5.1.4 --no-ri --no-rdoc

# gems
GEMS="bundler rails"
sudo gem install $GEMS --no-ri --no-rdoc

# For testing, we need phantomjs. Install it via NPM/Node
sudo apt-get -y install npm nodejs-legacy
sudo npm install -g phantomjs-prebuilt

# Patch ImageMagic policy.xml
sudo wget -q -O /etc/ImageMagick-6/policy.xml https://raw.githubusercontent.com/marriott-library/newspaper_works/7052ff3bf58022572870a0720d8c5a705090a833/config/vendor/imagemagick-6-policy.xml
