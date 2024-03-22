# 0x0A. Configuration management

## Install puppet
apt-get install -y ruby=1:2.7+1 --allow-downgrades
apt-get install -y ruby-augeas
apt-get install -y ruby-shadow
apt-get install -y puppet
You do not need to attempt to upgrade versions. This project is simply a set of tasks to familiarize you with the basic level syntax which is virtually identical in newer versions of Puppet.

Puppet 5 Docs

## Install puppet-lint
gem install puppet-lint

### Run It!
puppet-lint /etc/puppet/modules

### Fix Them!
puppet-lint --fix /etc/puppet/modules

# Puppet code that create file /tmp, of path /tmp/school, permission 0744, owner and group www-data, and content I love Puppet

file { '/tmp/school':
  ensure  => 'file',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet',
}