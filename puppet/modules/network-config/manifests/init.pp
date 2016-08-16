# Manage network configuration

class network-config {

  service {'network':
    ensure => 'running',
  }

  define set_ip_addr ( $iface_name, $ip_addr ) {
    file { "/etc/sysconfig/network-scripts/ifcfg-${iface_name}":
      content => template('network-config/eth.erb'),
    }
  }

  set_ip_addr { 'Configure host only adapter':
    iface_name => 'enp0s8',
    ip_addr => $vbox_ho_ip_addr,
    notify => Service['network'],
  }

}