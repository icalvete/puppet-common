class common::install {

  case $::osfamily {

    /^(Debian|Ubuntu)$/: {
      include common::debian::install
    }
    /^(CentOS|RedHat)$/: {
      include common::redhat::install
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }

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

  package {$common::params::cron_package:
    ensure  => present
  }

  class {'collectd':
    amqp_enabled => false
  }

  include mcollective, mcollective::client

}
