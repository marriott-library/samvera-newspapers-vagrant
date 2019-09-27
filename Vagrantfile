# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "samvera-newspapers"
  config.vm.box = "ubuntu/bionic64"
  #config.disksize.size = "15GB"

  config.vm.network :forwarded_port, guest: 3000, host: 3000 # Rails
  config.vm.network :forwarded_port, guest: 8983, host: 8983 # Solr
  config.vm.network :forwarded_port, guest: 8984, host: 8984 # Fedora
  config.vm.network :forwarded_port, guest: 8888, host: 8888 # Jasmine Tests

  config.vm.provider "virtualbox" do |v|
    v.memory = 5120
    v.cpus = 4
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end

  # Check our system locale -- make sure it is set to UTF-8
  # This also means we need to run 'dpkg-reconfigure' to avoid "unable to re-open stdin" errors (see http://serverfault.com/a/500778)
  # For now, we have a hardcoded locale of "en_US.UTF-8"
  locale = "en_US.UTF-8"
  config.vm.provision :shell, :inline => "echo 'Setting locale to UTF-8 (#{locale})...' && locale | grep 'LANG=#{locale}' > /dev/null || update-locale --reset LANG=#{locale} && dpkg-reconfigure -f noninteractive locales"

  # Turn off annoying console bells/beeps in Ubuntu (only if not already turned off in /etc/inputrc)
  config.vm.provision :shell, :inline => "echo 'Turning off console beeps...' && grep '^set bell-style none' /etc/inputrc || echo 'set bell-style none' >> /etc/inputrc"

  # Turn on SSH forwarding (so that 'vagrant ssh' has access to your local SSH keys, and you can use your local SSH keys to access GitHub, etc.)
  config.ssh.forward_agent = true

  # Prevent annoying "stdin: is not a tty" errors from displaying during 'vagrant up'
  # See also https://github.com/mitchellh/vagrant/issues/1673#issuecomment-28288042
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  shared_dir = "/vagrant"

  # ----
  # **NOTE TO DEVELOPERS**: you likely want to uncomment this setting below,
  #   but do so before provisioning this box for the first time,
  #   by uncommenting the below setting.  Using a synced folder means that
  #   you are mounting a host directory to your guest, and that the git checkout
  #   of newspaper_works done by provisioning of this guest is performed into
  #   this shared storage, easy for editing.
  # ----
  # config.vm.synced_folder "./newspaper_works", "/home/vagrant/newspaper_works", create: true

  config.vm.provision "shell", path: "./install_scripts/bootstrap.sh", args: shared_dir
  config.vm.provision "shell", path: "./install_scripts/java.sh", args: shared_dir
  config.vm.provision "shell", path: "./install_scripts/ruby.sh", args: shared_dir
  #config.vm.provision "shell", path: "./install_scripts/postgres.sh", args: shared_dir
  #config.vm.provision "shell", path: "./install_scripts/multitenancy.sh", args: shared_dir
  config.vm.provision "shell", path: "./install_scripts/newspaper_works_dependencies.sh", args: shared_dir
  config.vm.provision "shell", path: "./install_scripts/fits.sh", args: shared_dir, privileged: false
  config.vm.provision "shell", path: "./install_scripts/newspaper_works.sh", args: shared_dir, privileged: false
end
