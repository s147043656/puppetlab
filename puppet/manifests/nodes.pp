node 'c7i1.vtdomain' {
  file { '/tmp/hello':
    content => "Hello 22, world\n",
  }
}