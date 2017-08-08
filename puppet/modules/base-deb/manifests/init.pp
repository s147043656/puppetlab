# Manage standard set of packages for Deb based

class base-deb {
  file { '/etc/puppet/files':
    ensure => directory,
  }
  package { [ 'openssh-server'
            ]:
    ensure => installed,
  }
  file { '/run/resolvconf/resolv.conf':
    source => 'puppet:///modules/base-all/etc/resolv.conf',
  }
  file { '/tmp/openstack-dev-setup.sh':
    source => 'puppet:///modules/base-deb/openstack-dev-setup.sh',
  }

}
