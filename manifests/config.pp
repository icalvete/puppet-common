class common::config {

  file{'backup_dir':
    ensure => directory,
    path   => $common::params::backup_dir
  }
}
