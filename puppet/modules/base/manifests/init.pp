# Manage standard set of packages

class basepack1 {
  package { [ 'vim-enhanced', 'mc', 'wget', 'telnet' ]:
    ensure => installed,
  }
}
