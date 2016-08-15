# Manage Cassandra cluster

class cassandra {

  exec { 'Build cassandra docker image':
    command => "/usr/bin/cd /home/master/git-puppetlab/puppet/modules/cassandra/files && /bin/bash build_images.sh",
    require => Package['docker-engine'],
  }

  exec { 'Start cassandra cluster':
    command => "/usr/bin/cd /home/master/git-puppetlab/puppet/modules/cassandra/files/scripts && /bin/bash start_docker_cluster.sh cassandra",
    require => Exec['Build cassandra docker image'],
  }

}

