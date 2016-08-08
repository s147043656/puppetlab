node 'c7i1.vtdomain' {
  file { '/tmp/hello':
    content => "Hello, world\n",
  }
}