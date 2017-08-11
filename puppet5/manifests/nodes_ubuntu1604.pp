
node u16i102 {
  file { '/tmp/hello':
    content => "Hello u16i102!\n",
  }
  include base_all
  include base_ubuntu1604
}
