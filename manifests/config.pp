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

  ensure_resource('file', $common::params::backup_dir, {'ensure' => 'directory'})

  cron { 'cron_mailto':
    command     => '/bin/echo > /dev/null',
    user        => 'root',
    hour        => '0',
    minute      => '0',
    environment => "MAILTO=${common::params::cron_mailto}",
    require     => Package[$common::params::cron_package]
  }
}
