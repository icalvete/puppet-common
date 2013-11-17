class common::redhat::service inherits common::redhat {

  service {'iptables':
    ensure     => stopped,
    enable     => false,
    hasstatus  => true,
    hasrestart => true,
  }
}
