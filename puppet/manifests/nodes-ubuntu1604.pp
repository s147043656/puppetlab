node 'u16i102' {
  file { '/tmp/hello':
    content => "Hello u16i102!\n",
  }
  include network-config
  network-config::set_ip_addr_deb { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.102',
    notify => Exec["Service Networking Restart"],
  }
  exec { 'Service Networking Restart':
    command  => "/bin/systemctl restart networking.service",
    refreshonly => true,
  }
  include base-all
  include base-deb
}
