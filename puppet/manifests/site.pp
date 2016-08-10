# manifests/site.pp
# This takes care of other deprecation statements

Package {
  allow_virtual => true,
}

node default {
  hiera_include('classes')
}
