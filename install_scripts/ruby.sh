#!/bin/sh

echo "Setting up ruby environment"

# pre-requisites
PACKAGES="imagemagick libreadline-dev libyaml-dev libsqlite3-dev nodejs zlib1g-dev libsqlite3-dev redis-server"
sudo apt-get -y install $PACKAGES

# ruby and the development libraries (so we can compile nokogiri, kgio, etc)
sudo apt-get -y install ruby ruby-dev

# sudo chmod -R 0777 /tmp

# gems
#GEMS="bundler rails"
#sudo gem install $GEMS --no-ri --no-rdoc

sudo gem install bundler --no-ri --no-rdoc
sudo gem install rails --version=5.1.4 --no-ri --no-rdoc
#gem install rake

#sudo chown -R ubuntu:ubuntu /tmp/

#sudo chmod g+s /tmp/
# These should not requires sudo to install. Will resolve issue later
#sudo gem install rdf -v '2.2.12' --source 'https://rubygems.org/'
#sudo gem install json-ld -v '2.2.1' --source 'https://rubygems.org/'
#sudo gem install sxp -v '1.0.1' --source 'https://rubygems.org/'
#sudo gem install ldp -v '0.7.2' --source 'https://rubygems.org/'
#sudo gem install stomp -v '1.4.4' --source 'https://rubygems.org/'
#sudo gem install solrizer -v '3.4.1' --source 'https://rubygems.org/'


# For testing, we need phantomjs. Install it via NPM/Node
sudo apt-get -y install npm nodejs-legacy
sudo npm install -g phantomjs-prebuilt
