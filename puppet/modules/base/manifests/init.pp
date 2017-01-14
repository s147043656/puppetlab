# Manage standard set of packages

class base {
  package { [ 'mailx',
              'vim-enhanced',
              'mc', 'wget',
              'telnet',
              'bind-utils',
              'lynx',
              'ntpdate'
            ]:
    ensure => installed,
  }
  package { 'tcpdump':
    ensure => latest,
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
}
