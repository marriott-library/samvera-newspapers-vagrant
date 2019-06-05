#!/bin/sh
HOME="/home/vagrant"

echo "Creating Newspaper Works in ${HOME}/newspaper_works"
cd ${HOME}
sudo -u vagrant git clone https://github.com/marriott-library/newspaper_works.git newspaper_works
cd newspaper_works
sudo -u vagrant bundle install --path vendor/bundle # --quiet --path vendor/bundle
sudo -u vagrant bundle exec rake engine_cart:generate
cd .internal_test_app

# NewspaperWorks requires that your application's config/initializers/hyrax.rb be edited to make uploads optional for (all) work types
sed -i 's/# config.work_requires_files = true/config.work_requires_files = false/' config/initializers/hyrax.rb

# NewspaperWorks expects that your application's config/initializers/hyrax.rb be edited to enable a IIIF viewer
sed -i 's/# config.iiif_image_server = false/config.iiif_image_server = true/' config/initializers/hyrax.rb

# Output Messages
echo "Installation of Newspaper_Works application is complete..."
echo "There are two more steps that need to completed after the script completes"
echo "Generate Hyrax Default Admin Set"
echo "run the following command from /home/vagrant/newspaper_works/.internal_test_app/: bin/rails hyrax:default_admin_set:create"
echo "Generate Hyrad workflow"
echo "run the following command from /home/vagrant/newspaper_works/.internal_test_app/: bin/rails hyrax:workflow:load"
