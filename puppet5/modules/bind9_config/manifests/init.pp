# Manage standard set of packages

class bind9_config {
  package { [ 'bind9', 
              'bind9utils', 
              'bind9-doc',
            ]:
    ensure => installed,
  }
  file { '/lib/systemd/system/bind9.service':
    source => 'puppet:///modules/bind9_config/ns1/lib/systemd/system/bind9.service',
  }
  exec { "UFW allow bind":
    command => "ufw allow Bind9",
    path => '/usr/sbin',
    subscribe => File["/lib/systemd/system/bind9.service"],
    refreshonly => true,
  }
  file { '/etc/bind':
    ensure => directory,
    source => "puppet:///modules/bind9_config/ns1/etc/bind",
    recurse => 'true',
  }
  exec { "Bind restart":
    command => "systemctl restart bind9",
    path => '/bin',
    subscribe => File["/etc/bind"],
    refreshonly => true,
  }
}
