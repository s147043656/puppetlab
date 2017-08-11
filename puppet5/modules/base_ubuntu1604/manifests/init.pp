# Manage standard set of packages

class base_ubuntu1604 {
  package { [ 'lynx', 
            ]:
    ensure => installed,
  }
}
