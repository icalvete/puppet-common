class common::install {

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      package{['git', 'vim']:}

      case $lsbdistcodename {
        /^(xenial|bionic)$/: {
          include apt

          package{'software-properties-common':}

          apt::ppa { 'ppa:openjdk-r/ppa':
            require => Package['software-properties-common'],
            notify => Exec['apt_get_update']
          }
        }
      }

      exec { 'apt_get_update':
        command     => "/usr/bin/apt-get update",
        user        => 'root',
        refreshonly => true
      }
    }
  }
}
