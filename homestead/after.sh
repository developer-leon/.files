#!/bin/sh

# Install Slap Editor (https://github.com/slap-editor/slap):
echo "Installing Slap Editor"
sudo /usr/bin/npm install -g slap;

# Some php.ini settings:
echo "Adding custom settings to php.ini"
sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php5/cli/php.ini
sed -i "s/max_execution_time = .*/max_execution_time = 18000/" /etc/php5/fpm/php.ini
sed -i "s/magic_quotes_gpc = .*/magic_quotes_gpc = off/" /etc/php5/cli/php.ini
sed -i "s/magic_quotes_gpc = .*/magic_quotes_gpc = off/" /etc/php5/fpm/php.ini
sed -i "s/max_input_nesting_level = .*/max_input_nesting_level = 500/" /etc/php5/cli/php.ini
sed -i "s/max_input_nesting_level = .*/max_input_nesting_level = 500/" /etc/php5/fpm/php.ini
sed -i "s/;max_input_nesting_level/max_input_nesting_level/" /etc/php5/cli/php.ini
sed -i "s/;max_input_nesting_level/max_input_nesting_level/" /etc/php5/fpm/php.ini
sed -i "s/xdebug.max_nesting_level = .*/xdebug.max_nesting_level = 500/" /etc/php5/cli/php.ini
sed -i "s/xdebug.max_nesting_level = .*/xdebug.max_nesting_level = 500/" /etc/php5/fpm/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 20480M/" /etc/php5/cli/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 20480M/" /etc/php5/fpm/php.ini
sed -i "s/max_file_uploads = .*/max_file_uploads = 200/" /etc/php5/cli/php.ini
sed -i "s/max_file_uploads = .*/max_file_uploads = 200/" /etc/php5/fpm/php.ini
sed -i "s/post_max_size = .*/post_max_size = 0/" /etc/php5/cli/php.ini
find /etc/nginx/sites-available/ -type f -exec sed -i "s/error_log  \/var\/log\/nginx\//error_log  \/home\/vagrant\/box\/_log\//" {} \;

cat << EOF | sudo tee -a /etc/php5/cli/php.ini
magic_quotes_gpc = off
xdebug.max_nesting_level = 500
EOF

cat << EOF | sudo tee -a /etc/php5/fpm/php.ini
magic_quotes_gpc = off
xdebug.max_nesting_level = 500
EOF

# nginx global settings for heavy applications:
echo "Adding custom settings to nginx/conf.d/v.conf"
nginx_conf="
	client_header_timeout 18000;
	client_body_timeout 18000;
	fastcgi_read_timeout 18000;
	client_max_body_size 32m;
	fastcgi_buffers 8 128k;
	fastcgi_buffer_size 128k;
"
echo "$nginx_conf" > "/etc/nginx/conf.d/v.conf"

# Base Magento database:
# echo "Importing base Magento database..."
# mysql -u root -psecret magento < /home/vagrant/box/_db/file.sql

sudo service nginx restart
sudo service php5-fpm restart
sudo service hhvm stop
sudo service hhvm start
