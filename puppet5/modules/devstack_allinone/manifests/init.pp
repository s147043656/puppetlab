# Manage DevStack server

class devstack_allinone {
  file { '/usr/local/etc/devstack_local.conf':
    source => 'puppet:///modules/devstack_allinone/usr/local/etc/devstack_local.conf',
  }
  file { '/usr/local/bin/devstack-init.sh':
    source => 'puppet:///modules/devstack_allinone/usr/local/bin/devstack-init.sh',
  }
}
