class common::install {


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

  cron { 'cron_mailto':
    command     => '/bin/echo > /dev/null',
    user        => 'root',
    hour        => '0',
    minute      => '0',
    environment => "MAILTO=${common::params::cron_mailto}",
    require     => Package[$common::params::cron_package]
  }
}
