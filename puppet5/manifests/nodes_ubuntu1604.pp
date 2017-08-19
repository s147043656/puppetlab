### Ubuntu 16.04 nodes

node u16i2 {
  file { '/tmp/hello':
    content => "Hello u16i2!\n",
  }
  include network_config
    network_config::set_ip_addr_deb { 'Configure host only adapter':
      iface_name => 'enp0s8',
      ip_addr => '192.168.7.102',
  }
  include base_all
  include base_ubuntu1604
}
