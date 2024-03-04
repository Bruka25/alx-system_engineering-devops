# Update package lists
package { 'nginx':
  ensure   => latest,
  provider => 'apt',
}

# Define Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Create directory for Nginx configuration files
file { '/etc/nginx/conf.d':
  ensure => directory,
}

# Create Nginx configuration file for custom HTTP header
file { '/etc/nginx/conf.d/custom_headers.conf':
  ensure  => present,
  content => @(EOT),
# Custom HTTP headers configuration
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    # Custom HTTP header X-Served-By with the hostname
    add_header X-Served-By <%= @hostname %>;

    # Serve a simple "Hello World!" page
    location / {
        return 200 'Hello World!';
        add_header Content-Type text/plain;
    }

    # Error page configuration
    error_page 404 /404.html;
    location = /404.html {
        root /usr/share/nginx/html;
        internal;
    }
}
EOT
  require => Package['nginx'],
  notify  => Service['nginx'],
}
