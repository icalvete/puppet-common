class common inherits params {

  anchor {'common::begin':
    before => Class['common::virtual']
  }

  class {'common::virtual':
    require => Anchor['common::begin'],
  }

  class {'common::install':
    require => Class['common::virtual'],
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
