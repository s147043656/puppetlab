# Manage Cassandra cluster

class cassandra {

  exec { 'Build cassandra docker image':
    command => 'cd /home/master/git-develop/puppet/modules/cassandra/files && /bin/bash build_images.sh',
    unless => 'docker images | grep cassandra',
    path => '/usr/bin',
    timeout => 1800,
    require => Package['docker-engine'],
  }

  exec { 'Start cassandra cluster':
    command => 'cd /home/master/git-develop/puppet/modules/cassandra/files/scripts && /bin/bash start_docker_cluster.sh cassandra',
    path => '/usr/bin',
    timeout => 1800,
    require => Exec['Build cassandra docker image'],
  }

}

