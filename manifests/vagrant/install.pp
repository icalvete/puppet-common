class common::vagrant::install {

  package {'xinetd':
    ensure => present
  }
}

