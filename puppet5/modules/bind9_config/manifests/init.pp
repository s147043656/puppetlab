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
  file { '/data01':
    ensure => directory,
  }
}
