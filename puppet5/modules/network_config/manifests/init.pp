# Manage network configuration

class network_config {

  define set_ip_addr_rh ( $iface_name, $ip_addr ) {
    file { "/etc/sysconfig/network-scripts/ifcfg-${iface_name}":
      content => template('network_config/eth-rh.erb'),
    }
    exec { "Flush IP addr":
      command => "ip addr flush $iface_name",
      path => '/usr/sbin',
      subscribe => File["/etc/sysconfig/network-scripts/ifcfg-${iface_name}"],
      refreshonly => true,
    }
    exec { 'systemctl restart NetworkManager.service':
      path => '/usr/bin',
      provider => shell,
      subscribe => Exec["Flush IP addr"],
      refreshonly => true,
    }
  }

  define set_ip_addr_deb ( $iface_name, $ip_addr ) {
    file { "/etc/network/interfaces":
      content => template('network_config/eth-deb.erb'),
    }
    exec { "Flush IP addr":
#      command => "ip addr flush $iface_name",
      command => "ifdown --force $iface && sudo ip addr flush dev $iface && sudo ifup --force $iface",
      path => '/bin',
      subscribe => File["/etc/network/interfaces"],
      refreshonly => true,
    }
#    exec { "systemctl restart networking.service":
#      path => '/bin',
#      provider => shell,
#      subscribe => Exec["Flush IP addr"],
#      refreshonly => true,
#    }
  }

}