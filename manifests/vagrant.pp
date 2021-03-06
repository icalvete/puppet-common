class common::vagrant () inherits common::vagrant::params {

  anchor {'common::vagrant::begin':
    before => Class['common::vagrant::install']
  }
  class {'common::virtual':
    require => Anchor['common::vagrant::begin']
  }
  class {'common::vagrant::install':
    require => CLass['common::virtual']
  }
  class {'common::vagrant::config':
    require => Class['common::vagrant::install']
  }
  class {'common::vagrant::service':
    require => Class['common::vagrant::config']
  }
  anchor {'common::vagrant::end':
    require => Class['common::vagrant::service']
  }
}
