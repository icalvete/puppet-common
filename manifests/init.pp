class common inherits params {

  anchor {'common::begin':
    before => Class['common::virtual']
  }

  class {'common::virtual':
    require => Anchor['common::begin'],
  }

  anchor {'common::end':
    require => Class['common::virtual']
  }
}
