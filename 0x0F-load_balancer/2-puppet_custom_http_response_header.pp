# Update package lists
package { 'nginx-common':
  ensure   => latest,
  provider => 'apt',
}

# Install nginx
package { 'nginx':
  ensure   => latest,
  require  => Package['nginx-common'],
}

# Create directory for HTML files
file { '/etc/nginx/html':
  ensure => directory,
}

# Create index.html file with "Hello World!" content
file { '/etc/nginx/html/index.html':
  ensure  => present,
  content => "Hello World!\n",
}

# Create 404.html file with "Ceci n'est pas une page" content
file { '/etc/nginx/html/404.html':
  ensure  => present,
  content => "Ceci n'est pas une page\n",
}

# Configure Nginx server
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('nginx/default.conf.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Define Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Template for Nginx configuration file
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => @(EOT),
server {
    listen 80;
    listen [::]:80 default_server;
    root   /etc/nginx/html;
    add_header X-Served-By <%= @hostname %>;
    index  index.html index.htm;

    location /redirect_me {
        return 301 http://www.youtube.com/;
    }

    error_page 404 /404.html;
    location /404 {
      root /etc/nginx/html;
      internal;
    }
}
EOT
  require => Package['nginx'],
  notify  => Service['nginx'],
}
