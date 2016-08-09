node 'c7i1.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i1!\n",
  }
}

node 'c7i11.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i11!\n",
  }
  package {'vim':
    ensure => installed,
  }
}

node 'c7i12.vtdomain' {
  file { '/tmp/hello':
    content => "Hello c7i12!\n",
  }
  package {'vim':
    ensure => installed,
  }
}
