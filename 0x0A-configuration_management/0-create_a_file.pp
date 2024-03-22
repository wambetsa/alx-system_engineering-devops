# Puppet code that create file /tmp, of path /tmp/school, permission 0744, owner and group www-data, and content I love Puppet

file { '/tmp/school':
  ensure  => 'file',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
  content => 'I love Puppet',
}
