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

  $backup_dir                = hiera('backup_dir', '/srv/backup')
  $cron_mailto               = hiera('cron_mailto', 'icalvete@gmail.com')

  $redhat_epel_package       = hiera(
    'redhat_epel_package',
    'http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'
  )
  $redhat_puppetlabs_package = hiera(
    'redhat_puppetlabs_package',
    'http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm')
  $redhat_elrepo_package     = hiera(
    'redhat_elrepo_package',
    'http://elrepo.org/elrepo-release-6-5.el6.elrepo.noarch.rpm'
  )
}
