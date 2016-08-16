# Manage network configuration

class network-config {

  define set_ip_addr ( $iface_name, $ip_addr ) {
    file { "/etc/sysconfig/network-scripts/ifcfg-${iface_name}":
      content => template('network-config/eth.erb'),
    }
  }

  set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => '192.168.7.16',
  }

}