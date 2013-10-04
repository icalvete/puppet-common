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

  anchor {'common::end':
    require => Class['common::service']
  }
}
