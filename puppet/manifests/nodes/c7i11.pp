node /c7i11.vtdomain/ {
  file { '/tmp/hello':
    content => "Hello c7i11!\n",
  }
  include role::c7i11.vtdomain
  include base
  include nginx
}
