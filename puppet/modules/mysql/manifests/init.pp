# Manage Nginx web server

class mysql {
  package { [ 'mariadb-server', 'mariadb' ]:
    ensure => installed,
  }
}