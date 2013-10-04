class common::debian {

  case $::operatingsystemrelease {

    '12.04': {
      $puppetlabs_package = 'puppetlabs-release-precise.deb'
    }
    default: {
      fail ("${::operatingsystemrelease} not supported.")
    }
  }
}
