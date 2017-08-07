# Manage standard set of packages for Deb based

class base-deb {
  package { [ 'openssh-server'
            ]:
    ensure => installed,
  }
  file { '/run/resolvconf/resolv.conf':
    source => 'puppet:///modules/base-all/etc/resolv.conf',
  }
}
