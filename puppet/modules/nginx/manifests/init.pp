# Manage Nginx web server

class nginx {
  package { 'nginx':
    ensure => installed,
  }
}