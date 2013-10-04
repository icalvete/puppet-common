class common::params {

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $cron_package = 'cron'
    }
    /^(Redhat|CentOS)$/: {
      $cron_package = 'crontabs'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }

  $backup_dir                = hiera('backup_dir')
  $cron_mailto               = hiera('cron_mailto')

  $redhat_epel_package       = hiera('redhat_epel_package')
  $redhat_puppetlabs_package = hiera('redhat_puppetlabs_package')
  $redhat_elrepo_package     = hiera('redhat_elrepo_package')
}
