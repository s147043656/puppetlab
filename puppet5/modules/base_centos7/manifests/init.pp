# Manage standard set of packages

class base_centos7 {
  package { [ 'mailx', 
              'vim'
            ]:
    ensure => installed,
  }
}
