# Manage standard set of packages

class base {
  package { [ 'openssh-server',
              'mc',
              'ntpdate'
            ]:
    ensure => installed,
  }
  package { 'tcpdump':
    ensure => latest,
  }
  file { '/etc':
    ensure => directory,
    source => "puppet:///modules/base/etc",
    recurse => 'true',
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
