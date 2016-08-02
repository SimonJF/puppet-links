# Configures us a basic postgres install based on given params
class links::postgres {

  # Firstly, ensure that we have postgres installed
  class { 'postgresql::server': }

  # Next, ensure we've created the user specified in config
  postgresql::server::db {"${links::database_name}":
    user => "${links::database_username}",
    password => postgresql_password("${links::database_password}")
  }
  
  class { 'postgresql::client': }

}

