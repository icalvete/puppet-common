class common inherits params {

  anchor {'common::begin':
    before => Class['common::install']
  }

  class {'common::install':
    require => Anchor['common::begin'],
  }

  class {'common::config':
    require => Class['common::install']
  }

  class {'common::service':
    require => Class['common::config']
  }


  case $::osfamily {

    /^(Debian|Ubuntu)$/: {
      include common::debian
    }
    /^(CentOS|RedHat)$/: {
      include common::redhat
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }

  anchor {'common::end':
    require => Class['common::service']
  }
}
