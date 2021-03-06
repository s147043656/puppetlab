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
#  Disabled due to deprication in systemd usage
#  exec { 'Save iptables':
#    command     => "service iptables save",
#    refreshonly => true,
#  }

  file { '/etc/nginx/nginx.conf':
    source => 'puppet:///modules/nginx/configs/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  file { '/var/www':
    ensure => directory,
  }

#  Old manual way
#  file { '/var/www/cat-pictures':
#    source => 'puppet:///modules/nginx/www/cat-pictures',
#    recurse => 'true',
#    require => [ Package['nginx'], File['/var/www'] ]
#  }

  define deploy_site_job ( $site_name = $title ) {
    file { "/var/www/${site_name}":
      source => "puppet:///modules/nginx/www/${site_name}",
      recurse => 'true',
      require => File['/var/www'],
    }
    file { "/etc/nginx/conf.d/${site_name}.conf":
      content => template('nginx/vhost.conf.erb'),
      require => Package['nginx'],
      notify => Service['nginx'],
    }
  }

  $sites_list = ["cat-pictures", "dog-pictures", "hamster-pictures"]
  deploy_site_job { $sites_list: }

}
