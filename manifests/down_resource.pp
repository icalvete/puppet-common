define common::down_resource (

  $scheme   = 'http',
  $domain   = undef,
  $port     = undef,
  $user     = undef,
  $pass     = undef,
  $path     = undef,
  $resource = undef,
  $target = '/tmp'

) {

  if ! $domain {
    fail('domain parameter can\'t be empty')
  }

  if ! $resource {
    fail('resource parameter can\'t be empty')
  }


  if ! $port {
    $domain_real = $domain
  } else {
    $domain_real = "${domain}:${port}"
  }

  if ! $path {
    $path_real = $resource
  } else {
    $path_real = "${path}/${resource}"
  }

  if ! $user {
    $resource_source = "${scheme}://${domain_real}/${path_real}"
  } else {
    $resource_source = "${scheme}://${user}:${pass}@${domain_real}/${path_real}"
  }

  exec {"${name}_down_resource":
    cwd     => $target,
    command => "/usr/bin/wget --no-check-certificate ${resource_source}",
    creates => "${target}/${resource}",
  }
}
