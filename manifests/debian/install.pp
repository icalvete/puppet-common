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
    notify  => Exec['puppetlabs_debian_config_package'],
    unless  => '/usr/bin/test -f /etc/apt/sources.list.d/puppetlabs.list'
  }

  exec {'puppetlabs_debian_config_package':
    cwd         => '/tmp/',
    command     => '/usr/bin/apt-get update',
    require     => Exec['puppetlabs_debian_install_package'],
    refreshonly => true,
  }

  case $::operatingsystemrelease {

    '12.04': {
      realize Package['ruby1.8-dev']
    }
    '13.04': {
      realize Package['ruby1.9.1-dev']
    }
    '13.10': {
      realize Package['ruby1.9.1-dev']
    }
    default:{

    }
  }
}
