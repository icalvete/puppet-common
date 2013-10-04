class common::service {

case $::osfamily {

    /^(Debian|Ubuntu)$/: {
      include common::debian::service
    }
    /^(CentOS|RedHat)$/: {
      include common::redhat::service
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
