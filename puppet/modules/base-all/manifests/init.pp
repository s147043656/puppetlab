# Manage standard set of packages

class base-all {
  package { [ 'mc', 
              'ntpdate'
            ]:
    ensure => installed,
  }
#  file { '/etc':
#    ensure => directory,
#    source => "puppet:///modules/base-all/etc",
#    recurse => 'true',
#  }
  file { '/ets/hosts':
    source => 'puppet:///modules/base-all/etc/hosts',
  }
  file { '/ets/resolv.conf':
    source => 'puppet:///modules/base-all/etc/resolv.conf',
  }
  file { '/etc/localtime':
    ensure => link,
    target => '/usr/share/zoneinfo/Europe/Kiev',
  }
  cron { 'ntpdate-update':
    command => '/sbin/ntpdate ntp.ubuntu.com',
    user => 'root',
    minute => '*/3',
    require => [ Package['ntpdate'], File['/etc/localtime'], ],
  }
  file { '/data01':
    ensure => directory,
  }
}
