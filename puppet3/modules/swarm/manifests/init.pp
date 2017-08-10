# Manage Cassandra cluster

class swarm {

  exec { 'Install swarm':
    command => 'docker run swarm',
    unless => 'docker images | grep swarm',
    path => '/usr/bin',
    timeout => 1800,
    require => Package['docker-engine'],
  }

}

