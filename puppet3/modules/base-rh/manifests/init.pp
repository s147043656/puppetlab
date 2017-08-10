# Manage standard set of packages for RH based

class base-rh {
  package { [ 'mailx',
              'vim-enhanced',
              'wget',
              'telnet',
              'bind-utils',
              'lynx',
            ]:
    ensure => installed,
  }
  package { 'tcpdump':
    ensure => latest,
  }
  file { '/etc/resolv.conf':
    source => 'puppet:///modules/base-all/etc/resolv.conf',
  }
}
