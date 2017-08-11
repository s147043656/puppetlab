# Manage standard set of packages

class base_all {
  package { [ 'lynx',
              'ntpdate',
              'mc', 
              'vim'
            ]:
    ensure => installed,
  }
  file { '/etc/hosts':
    source => 'puppet:///modules/base_all/etc/hosts',
  }
  file { '/etc/localtime':
    ensure => link,
    target => '/usr/share/zoneinfo/Europe/Kiev',
  }
  cron { 'ntpdate-update':
    command => '/usr/sbin/ntpdate ntp.ubuntu.com',
    user => 'root',
    minute => '*/3',
    require => [ Package['ntpdate'], File['/etc/localtime'], ],
  }
  file { '/data01':
    ensure => directory,
  }
}
