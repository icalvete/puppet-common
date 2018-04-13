class common::virtual {

  # This packages can be realized in all manifest
  @package {'xinetd':
    ensure => present
  }

  @package {'syslog-ng':
    ensure => present
  }

  @package {'make':
    ensure => present
  }

  @package {'openjdk-7-jre':
    ensure => present
  }

  @package {'default-jre':
    ensure => present
  }

  @package {'java-1.6.0-openjdk':
    ensure => present
  }

  @package {'unzip':
    ensure => present
  }

  @package {'libltdl7':
    ensure   => present,
  }

  @package {'daemon':
    ensure => present
  }

  @package {'curl':
    ensure => present
  }

  @package {'libmaxminddb-dev':
    ensure => present
  }

  @package {'augeas-lenses':
    ensure => present
  }

  @package {'autossh':
    ensure => present
  }
}
