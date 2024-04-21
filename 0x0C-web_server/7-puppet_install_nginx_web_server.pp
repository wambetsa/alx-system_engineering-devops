# Configuring server using puppet
# install nginx and make it listen to port 80
# Puppet manifest to install and configure Nginx web server

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx
file { '/etc/nginx/sites-available/default':
  content => "
    server {
      listen 80;
      server_name _;

      location / {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
      }

      location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
      }

      location / {
        echo 'Hello World!';
      }
    }
  ",
  notify  => Service['nginx'],
}

# Enable Nginx site
file { '/etc/nginx/sites-enabled/default':
  ensure => 'link',
  target => '/etc/nginx/sites-available/default',
  notify => Service['nginx'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}
