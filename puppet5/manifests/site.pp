# manifests/site.pp

node default {
  file { '/tmp/hello':
    content => "Hello Default!\n",
  }
  include base_all
}

node c7i2 {
  file { '/tmp/hello':
    content => "Hello c7i2!\n",
  }
  include base_all
  include base_centos7
}

node u16i102 {
  file { '/tmp/hello':
    content => "Hello u16i102!\n",
  }
  include base_all
  include base_ubuntu1604
}
