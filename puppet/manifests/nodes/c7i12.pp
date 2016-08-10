node /c7i12.vtdomain/ {
  file { '/tmp/hello':
    content => "Hello c7i12!\n",
  }
  include role::c7i12.vtdomain
  include base
  include mysql
}
