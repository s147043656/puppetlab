# Manage network configuration

class network-config {

  define set_ip_address ( $iface_name = $title, $ip_address ) {
    file { "/etc/sysconfig/network-scripts/ifcfg-${iface_name}":
      content => template('network-config/files/eth.erb'),
    }
  }
}