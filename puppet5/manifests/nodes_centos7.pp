
node c7i2 {

  file { '/tmp/hello':
    content => "Hello c7i2!\n",
  }

  include network-config
  network-config::set_ip_addr_rh { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.2',
    notify => Service['network'],
  }

  include base_all
  include base_centos7

}
