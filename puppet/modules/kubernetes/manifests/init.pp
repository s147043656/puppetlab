# Manage Kubernetes server

class kubernetes {

  package { 'docker':
    ensure => installed,
  }

  package { 'kubernets-client':
    ensure => installed,
  }

  package { 'kubernetes-node':
    ensure => installed,
  }

  package { 'etcd':
    ensure => installed,
  }

  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }

}
