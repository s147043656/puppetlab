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

  exec { 'Open port 2377':
    command  => "/sbin/iptables -I INPUT 5 -m state --state NEW -p tcp --dport 2377 -j ACCEPT",
    unless   => "/sbin/iptables-save | grep 2377 | grep INPUT | grep ACCEPT | grep NEW | wc -l | xargs test 1 -le",
  }

}
