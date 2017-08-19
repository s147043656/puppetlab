
node c7i2 {
  file { '/tmp/hello':
    content => "Hello c7i2!\n",
  }
#  include base_all
  include base_centos7
}
