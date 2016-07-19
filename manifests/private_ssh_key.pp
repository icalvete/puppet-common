define common::private_ssh_key (

  $key    = 'id_rsa',
  $user   = 'root',
  $group  = 'root',
  $home   = '/root',
  $source = "${module_name}/ssh_keys"

) {

  file { "private_ssh_key_${name}":
    ensure  => present,
    path    => "${home}/.ssh/${key}",
    owner   => $user,
    group   => $group,
    mode    => '0400',
    source  => "puppet:///modules/${source}/${key}",
    require => File['ssh_directory']
  }
}
