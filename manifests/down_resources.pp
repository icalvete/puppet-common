define common::down_resources(

  $scheme   = 'http',
  $domain   = undef,
  $port     = undef,
  $user     = undef,
  $pass     = undef,
  $path     = undef,

) {

  common::down_resource {$name:
    scheme   => $scheme,
    domain   => $domain,
    port     => $port,
    user     => $user,
    pass     => $pass,
    path     => $path,
    resource => $name
  }
}
