class common::redhat {

  exec {'epel_redhat_install_package':
    cwd     => '/tmp/',
    command => "/bin/rpm -i ${common::params::redhat_epel_package}",
    unless  => '/usr/bin/test -f /etc/yum.repos.d/epel.repo'
  }

  exec {'puppetlabs_redhat_install_package':
    cwd     => '/tmp/',
    command => "/bin/rpm -i ${common::params::redhat_puppetlabs_package}",
    unless  => '/usr/bin/test -f /etc/yum.repos.d/puppetlabs.repo'
  }
}
