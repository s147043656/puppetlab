# manifests/site.pp
# This takes care of other deprecation statements

Package {
  allow_virtual => true,
}


### Bare instances

node 'c7i1.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i1!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.1',
    notify => Service['network'],
  }
  include base
}

node 'c7i2.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i2!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.2',
    notify => Service['network'],
  }
  include base
}

node 'c7i3.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i3!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.3',
    notify => Service['network'],
  }
  include base
}

node 'c7i4.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i4!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.4',
    notify => Service['network'],
  }
  include base
}

node 'c7i5.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i5!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.3',
    notify => Service['network'],
  }
  include base
}


### WEB and DB LAB instances

node 'c7i11.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i11!\nRow 2\n",
  }
  include base
  include nginx
}

node 'c7i12.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i12!\n",
  }
  include base
  include mysql
}

node 'c7i13.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i13!\n",
  }
  include base
  include docker
  include cassandra
}


### Docker LAB instances

node 'c7i14.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i14!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.14',
    notify => Service['network'],
  }
  include base
  include docker
}

node 'c7i15.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i15!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.15',
    notify => Service['network'],
  }
  include base
  include docker
}

node 'c7i16.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i16!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.16',
    notify => Service['network'],
  }
  include base
  include docker
}


### Kubernetes LAB instances

node 'c7i17.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i17!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.17',
    notify => Service['network'],
  }
  include base
  include kubernetes
  package { 'java-1.8.0-openjdk':
    ensure => installed,
  }
  package { 'docker-distribution':
    ensure => installed,
  }
  service { 'docker-distribution':
    ensure => running,
    enable => true,
    require => Package['docker-distribution'],
  }
  file { '/etc/kubernetes':
    ensure => directory,
    source => "puppet:///modules/kubernetes/etc",
    recurse => 'true',
  }
  file { '/usr/local/bin':
    ensure => directory,
    source => "puppet:///modules/kubernetes/usr/local/bin",
    recurse => 'true',
  }
}

node 'c7i18.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i18!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.18',
    notify => Service['network'],
  }
  include base
  include kubernetes
}

node 'c7i19.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i19!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.19',
    notify => Service['network'],
  }
  include base
  include kubernetes
}

node 'c7i20.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i20!\n",
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.20',
    notify => Service['network'],
  }
  include base
  include kubernetes
}


### Solr Cloud LAB instances

node 'scloud566.vtdomain' {
  file { '/tmp/hello':
    content => "Hello scloud566.vtdomain\n",
  }
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.21',
    notify => Service['network'],
  }
  include base
}

node 'scloud567.vtdomain' {
  file { '/tmp/hello':
    content => "Hello scloud567.vtdomain\n",
  }
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.22',
    notify => Service['network'],
  }
  include base
}

node 'scloud568.vtdomain' {
  file { '/tmp/hello':
    content => "Hello scloud568.vtdomain\n",
  }
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.23',
    notify => Service['network'],
  }
  include base
}

node 'scloud245.vtdomain' {
  file { '/tmp/hello':
    content => "Hello scloud245.vtdomain\n",
  }
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.31',
    notify => Service['network'],
  }
  include base
}

node 'scloud246.vtdomain' {
  file { '/tmp/hello':
    content => "Hello scloud246.vtdomain\n",
  }
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.32',
    notify => Service['network'],
  }
  include base
}

node 'scloud247.vtdomain' {
  file { '/tmp/hello':
    content => "Hello scloud247.vtdomain\n",
  }
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }
  include network-config
  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.33',
    notify => Service['network'],
  }
  include base
}
