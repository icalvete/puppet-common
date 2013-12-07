class common::install {

  include common::virtual

  # This can be instaled in all nodes
  package {'rubygems':
    ensure => present
  }

  package {'subversion':
    ensure  => present
  }

  package {'git':
    ensure  => present
  }

  package {'wget':
    ensure  => present
  }

  package {'ntpdate':
    ensure  => present
  }

  package {$common::params::cron_package:
    ensure  => present
  }

  case $::osfamily {

    /^(Debian|Ubuntu)$/: {
      realize Package['stomp']

      class {'common::debian::install':
        before => Class['mcollective', 'mcollective::client']
      }
    }
    /^(CentOS|RedHat)$/: {
      include common::redhat::install
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }

  class {'collectd':
    amqp_enabled => false
  }

  class  {'mcollective':
    before => Class['mcollective::client']
  }

  include mcollective::client

}
