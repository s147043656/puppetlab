# Manage Nginx web server

class nginx {

  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx'],
  }

  exec { 'Open port 80':
    command  => "/sbin/iptables -I INPUT 5 -m state --state NEW -p tcp --dport 80 -j ACCEPT",
    unless   => "/sbin/iptables-save | grep 80 | grep INPUT | grep ACCEPT | grep NEW | wc -l | xargs test 4 -le",
#    notify   => Exec["Save iptables"]
  }

#  exec { 'Save iptables':
#    command     => "service iptables save",
#    refreshonly => true,
#  }

}
