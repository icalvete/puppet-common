class common::debian {

  case $::operatingsystemrelease {

    '12.04': {
      $puppetlabs_package = 'puppetlabs-release-precise.deb'
    }
    '13.04': {
      $puppetlabs_package = 'puppetlabs-release-raring.deb'
    }
    '13.10': {
      $puppetlabs_package = 'puppetlabs-release-saucy.deb'
    }
    default: {
      fail ("${::operatingsystemrelease} not supported.")
    }
  }
}
