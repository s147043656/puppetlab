# Manage standard set of packages

class base {
  package { [ 'vim-enhanced', 'mc', 'wget', 'telnet' ]:
    ensure => installed,
  }
  package { 'tcpdump':
    ensure => latest,
  }
}
