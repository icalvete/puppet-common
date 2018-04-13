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
}
