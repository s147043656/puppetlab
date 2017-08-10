# manifests/site.pp

node default {
  file { '/tmp/hello':
    content => "Hello Default!\n",
  }
  include base_all
}
