class common::params {

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $cron_package = 'cron'
    }
    /^(Redhat|CentOS|AlmaLinux)$/: {
      $cron_package = 'crontabs'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }

  $backup_dir = lookup(
    'backup_dir',
    String,
    'first',
    '/srv/backup'
  )
  $cron_mailto = lookup(
    'cron_mailto',
    String,
    'first',
    'icalvete@gmail.com'
  )
}
