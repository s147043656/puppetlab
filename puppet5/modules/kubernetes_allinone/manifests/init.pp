# Manage Kubernetes All in One server
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html/getting_started_with_kubernetes/get_started_orchestrating_containers_with_kubernetes

class kubernetes_allinone {

# 1.3.1 - 2. Install Kubernetes
  package { 'kubernetes-client':
    ensure => installed,
  }
  package { 'kubernetes-node':
    ensure => installed,
  }
  package { 'etcd':
    ensure => installed,
  }

# 1.3.1 - 3. Disable firewall
  service { 'firewalld':
    ensure => stopped,
    enable => false,
  }

# 1.3.1 - 5. Install registry
  package { 'docker-distribution':
    ensure => installed,
  }

# 1.3.1 - 6. Start the local Docker Registry
  file { '/etc/docker/daemon.json':
    source => "puppet:///modules/kubernetes_allinone/etc/docker/daemon.json",
  }
  service { 'docker':
    ensure => running,
    enable => true,
    require => Package['docker-distribution'],
  }
  service { 'docker-distribution':
    ensure => running,
    enable => true,
    require => Package['docker-distribution'],
  }

# 1.3.2 - 2. Create manifest files
# 1.3.2 - 3. Cofigure the kublet service
  file { '/etc/kubernetes':
    ensure => directory,
    source => "puppet:///modules/kubernetes_allinone/etc/kubernetes",
    recurse => 'true',
  }

# Install bootstrap script
  file { '/usr/local/bin/kubernetes-init.sh':
    source => "puppet:///modules/kubernetes_allinone/usr/local/bin/kubernetes-init.sh",
  }

}
