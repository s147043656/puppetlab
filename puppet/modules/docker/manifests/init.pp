# Manage Docker server

class docker {

  file { '/etc/yum.repos.d/docker.repo':
    source => 'puppet:///modules/docker/docker.repo',
  }

  package { 'docker-engine':
    ensure => installed,
  }

  service { 'docker':
    ensure => running,
    enable => true,
    require => Package['docker'],
  }

}
