#!/bin/sh
HOME="/home/vagrant"

echo "Creating Newspaper Works demo in ${HOME}/newspaper_works"
cd ${HOME}
sudo -u vagrant git clone https://github.com/marriott-library/newspaper_works.git newspaper_works
cd newspaper_works
sudo -u vagrant bundle install --path vendor/bundle # --quiet --path vendor/bundle
sudo -u vagrant bundle exec rake engine_cart:generate
# Future work
# cd .internal_test_app
# rake hyrax:default_admin_set:create hyrax:workflow:load
# NewspaperWorks requires that your application's config/initializers/hyrax.rb be edited to make uploads optional for (all) work types, by setting config.work_requires_files = false
# NewspaperWorks expects that your application's config/initializers/hyrax.rb be edited to enable a IIIF viewer, by setting config.iiif_image_server = true
echo "Installation of Newspaper_Works application is complete..."
