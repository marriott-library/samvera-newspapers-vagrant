# samvera-vagrant

A Vagrant environment to quickly setup Newspaper_Works [Hyrax](http://hyr.ax/)

## Requirements

* [Vagrant](https://www.vagrantup.com/) version 1.8.3+
* [VirtualBox](https://www.virtualbox.org/) version 5.1.38+

## Setup

1. `git clone https://github.com/marriott-library/samvera-vagrant.git`
2. `cd samvera-vagrant`
3. `vagrant up`

You can shell into the machine with `vagrant ssh` or `ssh -p 2222 vagrant@localhost`

## Using the App

* The Vagrant box contains Newspaper_Works application:
  * Newspaper_Works `/home/vagrant/newspaper_works`

* Start vagrant box provisioning: `cd samvera-vagrant && vagrant up`

* Shell into vagrant box **three times** `vagrant ssh`

* First shell (start fcrepo_wrapper)
`cd /home/ubuntu/newspaper_works && fcrepo_wrapper --config config/fcrepo_wrapper_test.yml`

* Second shell (start solr_wrapper)
`cd /home/ubuntu/newspaper_works && solr_wrapper --config config/solr_wrapper_test.yml`
* Third shell testing and development

* Run spec tests
`cd /home/ubuntu/newspaper_works && rake spec`

* Run rails console
`cd /home/ubuntu/newspaper_works && rails s`

## Environment

* Ubuntu 16.04 LTS 64-bit base machine
* [Hyrax](https://github.com/samvera-labs/hyrax) or [Hyku](https://github.com/samvera-labs/hyku): [http://localhost:3000](http://localhost:3000)
* [Solr 7.6.0](http://lucene.apache.org/solr/): [http://localhost:8983/solr/](http://localhost:8983/solr/)
* [Fedora 4.7.3](http://fedorarepository.org/): [http://localhost:8984/](http://localhost:8984/)

## Thanks

This VM is a modified version of the [Fedora 4 Vagrant](http://github.com/fcrepo4-exts/fcrepo4-vagrant), with borrowings from the [UCSD DAMS Vagrant](https://github.com/ucsdlib/dams-vagrant).
