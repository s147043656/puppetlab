node 'c7i1' {
  file { '/tmp/hello':
    content => "Hello, world\n",
  }
}