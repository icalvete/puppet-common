class common::debian {

  case $::operatingsystemrelease {

    '12.04': {
      $puppetlabs_package = 'puppetlabs-release-precise.deb'
    }
    default: {
      fail ("${::operatingsystemrelease} not supported.")
    }
  }

  common::down_resource {'puppetlabs_debian_get_package':
    scheme   => 'http',
    domain   => 'apt.puppetlabs.com',
    port     => false,
    user     => false,
    pass     => false,
    resource => $puppetlabs_package,
  }

  exec {'puppetlabs_debian_install_package':
    cwd     => '/tmp/',
    command => "/usr/bin/dpkg -i ${puppetlabs_package}",
    require => Common::Down_resource['puppetlabs_debian_get_package'],
    unless  => '/usr/bin/dpkg -l puppet* | grep puppetlabs-release'
  }

  exec {'puppetlabs_debian_config_package':
    cwd     => '/tmp/',
    command => '/usr/bin/apt-get update',
    require => Exec['puppetlabs_debian_install_package'],
    unless  => '/usr/bin/dpkg -l puppetlabs-release | grep ii'
  }

}
