class common::debian::install inherits common::debian {

  common::down_resource {'puppetlabs_debian_get_package':
    scheme   => 'http',
    domain   => 'apt.puppetlabs.com',
    port     => false,
    user     => false,
    pass     => false,
    resource => $common::debian::puppetlabs_package,
  }

  exec {'puppetlabs_debian_install_package':
    cwd     => '/tmp/',
    command => "/usr/bin/dpkg -i ${common::debian::puppetlabs_package}",
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
