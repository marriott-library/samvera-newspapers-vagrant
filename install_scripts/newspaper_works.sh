#!/bin/sh
HOME="/home/vagrant"

echo "Creating Newspaper Works demo in ${HOME}/newspaper_works"
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

# Uncomment the devise secret key from the devise initialzier
sed -i 's/# config.secret_key/config.secret_key/' config/initializers/devise.rb

# Output Messages
echo "Installation of Newspaper_Works application is complete..."
