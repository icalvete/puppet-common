class common::virtual {

  # This packages can be realized in all manifest
  @package {'openjdk-7-jre':
    ensure => present
  }

  @package {'unzip':
    ensure => present
  }

  @package {'erlang':
    ensure => present
  }

  @package {'libltdl7':
    ensure   => present,
  }

  @package {'stomp':
    ensure   => present,
    provider => 'gem'
  }

  @package {'ruby-devel':
    ensure => present
  }
}
