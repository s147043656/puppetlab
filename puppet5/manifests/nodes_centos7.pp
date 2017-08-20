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
