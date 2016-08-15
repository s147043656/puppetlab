# Manage Cassandra cluster

class cassandra {

  exec { 'Build cassandra docker image':
    command => 'cd /home/master/git-develop/puppet/modules/cassandra/files && /bin/bash build_images.sh',
    path => '/usr/bin',
    require => Package['docker-engine'],
  }

  exec { 'Start cassandra cluster':
    command => 'cd /home/master/git-puppetlab/puppet/modules/cassandra/files/scripts && /bin/bash start_docker_cluster.sh cassandra',
    path => '/usr/bin',
    require => Exec['Build cassandra docker image'],
  }

}

