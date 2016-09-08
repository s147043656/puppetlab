# Manage standard set of packages

class base {
  package { [ 'mailx',
              'vim-enhanced',
              'mc', 'wget',
              'telnet',
              'bind-utils',
              'lynx'
            ]:
    ensure => installed,
  }
  package { 'tcpdump':
    ensure => latest,
  }
}
