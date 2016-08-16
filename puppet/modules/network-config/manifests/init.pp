# Manage network configuration

class network-config {

  define set_ip_address ( $iface_name, $ip_addr ) {
    file { "/etc/sysconfig/network-scripts/ifcfg-${iface_name}":
      content => template('network-config/eth.erb'),
    }
  }
}