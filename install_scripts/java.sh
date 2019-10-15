###
# Java
###

# Java
if which java >/dev/null; then
  echo "skip java installation"
else
  # install distro default
  echo "java installation"
  # install and make JDK 8 default java executable (for Fedora, Solr, etc)
  apt-get -y install openjdk-8-jre-headless
  update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
fi
