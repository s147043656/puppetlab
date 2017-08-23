### Ubuntu 16.04 nodes

node u16i101 {
  file { '/tmp/hello':
    content => "Hello u16i101!\n",
  }
  include network_config
    network_config::set_ip_addr_deb { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.101',
  }
  include base_all
  include base_ubuntu1604
}

node u16i102 {
  file { '/tmp/hello':
    content => "Hello u16i102!\n",
  }
  include network_config
    network_config::set_ip_addr_deb { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.102',
  }
  include base_all
  include base_ubuntu1604
}

node u16i111 {
  file { '/tmp/hello':
    content => "Hello u16i111!\n",
  }
  include network_config
    network_config::set_ip_addr_deb { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.111',
  }
  include base_all
  include base_ubuntu1604
  include devstack_allinone
}

node ns1 {
  file { '/tmp/hello':
    content => "Hello ns1!\n",
  }
  include network_config
    network_config::set_ip_addr_deb { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.100',
  }
  include base_all
  include bind9_config
}
