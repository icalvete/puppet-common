class common::vagrant::install {

  package {'git':
    ensure => present
  }
  package {'vim':
    ensure => present
  }
  package {'xinetd':
    ensure => present
  }
}

