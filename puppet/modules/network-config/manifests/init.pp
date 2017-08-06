# Manage network configuration

class network-config {

  service {'network':
    ensure => 'running',
  }

  define set_ip_addr_rh ( $iface_name, $ip_addr ) {
    file { "/etc/sysconfig/network-scripts/ifcfg-${iface_name}":
      content => template('network-config/eth-rh.erb'),
    }
  }

  define set_ip_addr_deb ( $iface_name, $ip_addr ) {
    file { "/etc/network/interfaces":
      content => template('network-config/eth-deb.erb'),
    }
  }

#  set_ip_addr { 'Configure host only adapter':
#    iface_name => 'enp0s8',
#    ip_addr => '192.168.7.16',
#    notify => Service['network'],
#  }

}