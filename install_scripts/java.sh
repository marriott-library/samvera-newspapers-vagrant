###
# Java
###

# Java
if which java >/dev/null; then
  echo "skip java 9 installation"
else
  echo "java 9 installation"
  apt-get install --yes default-jdk
fi
