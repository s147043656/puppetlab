# manifests/site.pp
# This takes care of other deprecation statements

Package {
  allow_virtual => true,
}

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

node 'c7i14.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i14!\n",
  }
  include base
  include docker
  include swarm
}

node 'c7i15.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i15!\n",
  }
  include base
  include docker
  include swarm
}

node 'c7i16.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i16!\n",
  }
  include network-config
  include base
  include docker
  include swarm

  network-config::set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.16',
    notify => Service['network'],
  }

}
