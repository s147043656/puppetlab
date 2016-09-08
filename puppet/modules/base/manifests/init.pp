# Manage standard set of packages

class base {
  package { [ 'mailx',
              'vim-enhanced',
              'mc', 'wget',
              'telnet',
              'bind-utils' 
            ]:
    ensure => installed,
  }
  package { 'tcpdump':
    ensure => latest,
  }
}
