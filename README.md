# samvera-newspapers-vagrant

A Vagrant environment to quickly setup Newspaper_Works [Hyrax](https://hyrax.samvera.org/)

## Host System Requirements (install these before proceeding)

*   [Vagrant](https://www.vagrantup.com/) version 1.8.3+
*   [VirtualBox](https://www.virtualbox.org/) version 5.1.38+
*   [vagrant-disksize](https://github.com/sprotheroe/vagrant-disksize) (optional)

## Test Environment Setup (provisioning of virtual machine)

1.  `git clone https://github.com/marriott-library/samvera-newspapers-vagrant`
2.  `cd samvera-newspapers-vagrant`
3.  `vagrant up`

You can shell into the machine with `vagrant ssh` or `ssh -p 2222 vagrant@localhost`

*   The default disk for the Vagrant VM is 10gb. If you need more disk space, modify the vagrant file and uncomment line 11 ` #config.disksize.size = "15GB"` and set the preferred disk size. Then go back to step 3.

## Testing the Newspaper_works Application

*   Ensure you're in the samvera-newspapers-vagrant directory

*   Shell into the vagrant box **three times** using `vagrant ssh`

*   First shell (start fcrepo_wrapper)
`cd /home/vagrant/newspaper_works && fcrepo_wrapper --config config/fcrepo_wrapper_test.yml`

*   Second shell (start solr_wrapper)
`cd /home/vagrant/newspaper_works && solr_wrapper --config config/solr_wrapper_test.yml`

*   Third shell testing and development

*   **before running tests ensure the previous two tasks have completed and you see the following text in the shell windows**
    *   first shell `http://127.0.0.1:8986/`
    *   second shell `http://127.0.0.1:8985/solr/`

*   Run spec tests
`cd /home/vagrant/newspaper_works && rake spec`

*   Run rails console
`cd /home/vagrant/newspaper_works/ && rails c test`

## Evaluation Environment for Newspaper_works

*   Ensure you're in the samvera-newspapers-vagrant directory

*   Shell into vagrant box **three times** `vagrant ssh`

*   First shell (start fcrepo_wrapper)

    `cd /home/vagrant/newspaper_works/.internal_test_app && fcrepo_wrapper`

*   Second shell (start solr_wrapper)

     `cd /home/vagrant/newspaper_works/.internal_test_app && solr_wrapper`

*   Third shell create workflows and admin sets

    `cd /home/vagrant/newspaper_works/.internal_test_app/ && bin/rails hyrax:default_admin_set:create`

    then run

    `cd /home/vagrant/newspaper_works/.internal_test_app/ && bin/rails hyrax:workflow:load`

*   Fourth run rails web server

    `cd /home/vagrant/newspaper_works/.internal_test_app && rails s -b 0.0.0.0`

### Optional

*   *Developers, before you bring up this box for the first time:*
  consider whether you want to edit files from tools on your host machine.
  If so, opt-in to enable a synced folder in [`Vagrantfile`](Vagrantfile#L50)
  by uncommenting the `config.vm.synced_folder` setting.

*   Run rails console

    `cd /home/vagrant/newspaper_works/.internal_test_app && rails c`

## Environment

*   [Ubuntu 18.04 LTS 64-bit](http://releases.ubuntu.com/18.04/)
*   [Newspaper_works 1.0](https://github.com/marriott-library/newspaper_works)
*   [Hyrax 2.6.0](https://github.com/samvera/hyrax) : [http://localhost:3000](http://localhost:3000)
*   [Apache Solr 7.7.2](http://lucene.apache.org/solr/) :  [http://localhost:8983/solr/](http://localhost:8983/solr/)
*   [Fedora Commons 4.7.3](http://fedorarepository.org/) :  [http://localhost:8984/](http://localhost:8984/)
*   [Ruby 2.5.5](https://rubyonrails.org/)
*   [Rails 5.1.7](https://rubyonrails.org/)

## Newspaper_works Dependencies

*   [FITS](https://projects.iq.harvard.edu/fits/home)
*   [tesseract-ocr](https://github.com/tesseract-ocr/)
*   [libreoffice](https://www.libreoffice.org/)
*   [ghostscript](https://www.ghostscript.com/)
*   [poppler-utils](https://poppler.freedesktop.org/)
*   [libcurl3](https://packages.ubuntu.com/search?keywords=libcurl3)
*   [libopenjp2-tools](https://www.openjpeg.org/)
*   [Google Chrome](https://www.google.com/chrome/) (running tests)

## Thanks

This VM is a modified version of the [Fedora 4 Vagrant](http://github.com/fcrepo4-exts/fcrepo4-vagrant), with borrowings from the [UCSD DAMS Vagrant](https://github.com/ucsdlib/dams-vagrant).
