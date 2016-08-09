node 'c7i11.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i11!\n",
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
