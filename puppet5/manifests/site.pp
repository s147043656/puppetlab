# manifests/site.pp
# This takes care of other deprecation statements

Package {
  allow_virtual => true,
}

node default {
  file { '/tmp/hello':
    content => "Hello Default!\n",
  }
  include base-all
}
