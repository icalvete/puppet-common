class common inherits params {

  anchor {'common::begin':
    before => Class['common::virtual']
  }

  class {'common::install':
    require => Anchor['common::begin'],
  }

  class {'common::virtual':
    require => Class['common::install'],
  }

  anchor {'common::end':
    require => Class['common::virtual']
  }
}
