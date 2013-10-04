class common::config {

  case $::osfamily {

    /^(Debian|Ubuntu)$/: {
      include common::debian::config
    }
    /^(CentOS|RedHat)$/: {
      include common::redhat::config
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }

  file{'backup_dir':
    ensure => directory,
    path   => $common::params::backup_dir
  }

  cron { 'cron_mailto':
    command     => '/bin/echo > /dev/null',
    user        => 'root',
    hour        => '0',
    minute      => '0',
    environment => "MAILTO=${common::params::cron_mailto}",
    require     => Package[$common::params::cron_package]
  }
}
