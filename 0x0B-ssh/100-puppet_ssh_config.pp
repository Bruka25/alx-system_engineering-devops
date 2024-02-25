# Puppet manifest congiguration to connect to our server without
# a password 
# Identiied by private key  ~/.ssh/school
 
file { '/etc/ssh/ssh_config':
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => "

Host *
    IdentityFile ~/.ssh/school

PasswordAuthentication no
",
}
