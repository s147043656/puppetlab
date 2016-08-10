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
    unless   => "/sbin/iptables-save | grep 80 | grep INPUT | grep ACCEPT | grep NEW | wc -l | xargs test 1 -le",
#    notify   => Exec["Save iptables"]
  }

#  exec { 'Save iptables':
#    command     => "service iptables save",
#    refreshonly => true,
#  }

  file { '/etc/nginx':
    source => 'puppet:///modules/nginx/configs',
    recurse => 'true',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  file { '/var/www':
    ensure => directory,
  }

  file { '/var/www/cat-pictures':
    source => 'puppet:///modules/nginx/www/cat-pictures',
    recurse => 'true',
    require => [ Package['nginx'], File['/var/www'] ]
  }

}
