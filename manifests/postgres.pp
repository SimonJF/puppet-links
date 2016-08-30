# Configures us a basic postgres install based on given params
class links::postgres(
    $database_username = $links::params::database_username,
    $database_password = $links::params::database_password,
    $database_name = $links::params::database_name,
    $database_host = $links::params::database_host
  ) {

  # Firstly, ensure that we have postgres installed
  class { 'postgresql::server': }

  # Next, ensure we've created the user specified in config
  postgresql::server::db { $database_name:
    user => $database_username,
    password => postgresql_password($database_username, $database_password),
  }
  
  class { 'postgresql::client': }

}

