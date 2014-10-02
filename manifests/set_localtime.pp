define common::set_localtime (

  $zone = 'Europe/Madrid',

) {

  if $zone == '' {
    fail("Using default value ( ${zone} ) for zone")
  }

  exec{ 'set_localtime':
    command => "/bin/ln -sf /usr/share/zoneinfo/${zone} /etc/localtime",
  }
}
