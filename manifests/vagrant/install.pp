class vagrant::install {

  package {'xinetd':
    ensure => present
  }
}

