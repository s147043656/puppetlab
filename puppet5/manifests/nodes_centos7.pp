### Centos 7 nodes

node c7i1 {
  file { '/tmp/hello':
    content => "Hello c7i1!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.1',
  }
  include base_all
  include base_centos7
}

node c7i2 {
  file { '/tmp/hello':
    content => "Hello c7i2!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.2',
  }
  include base_all
  include base_centos7
}

node c7i17 {
  file { '/tmp/hello':
    content => "Hello c7i17!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.17',
  }
  include base_all
  include base_centos7
  include kubernetes_allinone
}

#### c7i40-50

node c7i40 {
  file { '/tmp/hello':
    content => "Hello c7i40!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.40',
  }
  include base_all
  include base_centos7
}

node c7i41 {
  file { '/tmp/hello':
    content => "Hello c7i41!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.41',
  }
  include base_all
  include base_centos7
}

node c7i42 {
  file { '/tmp/hello':
    content => "Hello c7i42!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.42',
  }
  include base_all
  include base_centos7
}

node c7i43 {
  file { '/tmp/hello':
    content => "Hello c7i43!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.43',
  }
  include base_all
  include base_centos7
}

node c7i44 {
  file { '/tmp/hello':
    content => "Hello c7i44!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.44',
  }
  include base_all
  include base_centos7
}

node c7i45 {
  file { '/tmp/hello':
    content => "Hello c7i45!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.45',
  }
  include base_all
  include base_centos7
}

node c7i46 {
  file { '/tmp/hello':
    content => "Hello c7i46!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.46',
  }
  include base_all
  include base_centos7
}

node c7i47 {
  file { '/tmp/hello':
    content => "Hello c7i47!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.47',
  }
  include base_all
  include base_centos7
}

node c7i48 {
  file { '/tmp/hello':
    content => "Hello c7i48!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.48',
  }
  include base_all
  include base_centos7
}

node c7i49 {
  file { '/tmp/hello':
    content => "Hello c7i49!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.49',
  }
  include base_all
  include base_centos7
}

node c7i50 {
  file { '/tmp/hello':
    content => "Hello c7i50!\n",
  }
  include network_config
    network_config::set_ip_addr_rh { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.50',
  }
  include base_all
  include base_centos7
}

