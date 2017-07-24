# Manage Kubernetes server

class kubernetes {

  package { 'docker':
    ensure => installed,
  }

  service { 'docker':
    ensure => started,
    enable => true,
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

  service { 'etcd':
    ensure => started,
    enable => true,
  }

  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }

}
