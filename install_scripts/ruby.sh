#!/bin/sh

echo "Setting up ruby environment"

# pre-requisites
PACKAGES="imagemagick libreadline-dev libyaml-dev libsqlite3-dev nodejs zlib1g-dev libsqlite3-dev redis-server"
sudo apt-get -y install $PACKAGES

# ruby and the development libraries (so we can compile nokogiri, kgio, etc)
sudo apt-get -y install ruby2.5 ruby2.5-dev

sudo gem install bundler --no-ri --no-rdoc
sudo gem install rails -v '~> 5.1.7' --no-ri --no-rdoc

# For testing, we need phantomjs. Install it via NPM/Node
sudo apt-get -y install npm nodejs
sudo npm install -g phantomjs-prebuilt

# Patch ImageMagic policy.xml
sudo wget -q -O /etc/ImageMagick-6/policy.xml https://raw.githubusercontent.com/marriott-library/newspaper_works/b74ef957892aab9a4b8cf4196a851db9cf810350/config/vendor/imagemagick-6-policy.xml
