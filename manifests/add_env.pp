define common::add_env (

  $key   = '',
  $value = ''

) {

  include common

  if $key == '' {
    fail('key parameter can\'t be empty')
  }

  if $value == '' {
    fail('value parameter can\'t be empty')
  }

  augeas{"env_${name}":
    context => '/files/etc/environment',
    changes => "set ${key} \"$value\"",
  }
}
