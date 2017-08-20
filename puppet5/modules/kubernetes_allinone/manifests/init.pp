# Manage Kubernetes server

class kubernetes_allinone {

  package { 'docker':
    ensure => installed,
  }

  service { 'docker':
    ensure => running,
    enable => true,
    require => Package['docker'],
  }

  package { 'kubernetes-client':
    ensure => installed,
  }

  package { 'kubernetes-node':
    ensure => installed,
  }

  package { 'etcd':
    ensure => installed,
  }

  service { 'etcd':
    ensure => running,
    enable => true,
    require => Package['etcd'],
  }

  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }

}
