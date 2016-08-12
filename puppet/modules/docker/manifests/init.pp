# Manage Docker server

class docker {

  file { '/etc/yum.repos.d/docker.repo':
    source => 'puppet:///modules/docker/docker.repo',
  }

  package { 'docker-engine':
    ensure => installed,
    require => File['/etc/yum.repos.d/docker.repo'],
  }

  service { 'docker':
    ensure => running,
    enable => true,
    require => Package['docker-engine'],
  }

}
