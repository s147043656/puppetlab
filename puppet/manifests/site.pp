# manifests/site.pp
# This takes care of other deprecation statements

Package {
  allow_virtual => true,
}

node 'c7i11.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i11!\nRow 2\n",
  }
  include base
  include nginx
}

node 'c7i12.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i12!\n",
  }
  include base
  include mysql
}

node 'c7i13.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i13!\n",
  }
  include base
  include docker
}
