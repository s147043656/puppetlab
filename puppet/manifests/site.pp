# manifests/site.pp
# This takes care of other deprecation statements
Package {
  allow_virtual => true,
}

import 'nodes.pp'