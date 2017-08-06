# Manage standard set of packages for Deb based

class base-deb {
  package { [ 'openssh-server'
            ]:
    ensure => installed,
  }
}
