class common::install {

  # This can be instaled in all nodes
  package {'rubygems':
    ensure => present
  }

  package {'stomp':
    ensure   => present,
    provider => 'gem',
    require  => Package['rubygems'],
    before   => Class['mcollective', 'mcollective::client']
  }

  exec {'mcollective_gem':
    command => '/usr/bin/gem install mcollective --no-ri --no-rdoc',
    unless  => '/usr/bin/gem list | /bin/grep mcollective',
    require => Package['rubygems'],
    before  => Class['mcollective', 'mcollective::client']
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

  package {'ntpdate':
    ensure  => present
  }

  package {$common::params::cron_package:
    ensure  => present
  }

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

  class {'collectd':
    amqp_enabled => false
  }

  include mcollective
  include mcollective::client
}
