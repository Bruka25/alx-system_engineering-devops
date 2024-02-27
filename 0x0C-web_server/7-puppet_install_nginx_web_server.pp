# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
      listen 80;
      listen [::]:80;
      root /var/www/html;
      index index.html;

      location / {
        return 200 'Hello World!\n';
      }

      location /redirect_me {
        return 301 http://cuberule.com/;
      }
    }
  ",
  notify  => Service['nginx'],
}

# Enable default site by creating symlink to sites-enabled
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
  notify => Service['nginx'],
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}
