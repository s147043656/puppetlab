# Manage Nginx web server

class nginx {
  package { 'nginx':
    ensure => installed,
  }
  service { 'nginx':
    ensure => running,
    require => Package['nginx'],
}
