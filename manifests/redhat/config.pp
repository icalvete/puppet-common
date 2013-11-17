class common::redhat::config inherits common::redhat {

  exec {"config_selinux_${common::redhat::selinux}":
    command => "/bin/sed -i 's/^\(SELINUX=\).*/\1${common::redhat::selinux}/' /etc/selinux/config",
    notify  => Exec["set_selinux_${common::redhat::selinux}"],
    unless  => "/bin/grep -e '^SELINUX=${common::redhat::selinux}' /etc/selinux/config"
  }

  if $common::redhat::selinux != 'disabled' {
    $enforce_value = $common::redhat::selinux
  } else {
    $enforce_value = 'permissive'
    notify{'¡¡¡ Host must be rebboted to really disable SELINUX !!!':}
  }

  exec {"set_selinux_${common::redhat::selinux}":
    command     => "/usr/sbin/setenforce ${enforce_value}",
    refreshonly => true,
    require     => Exec["config_selinux_${common::redhat::selinux}"]
  }
}
