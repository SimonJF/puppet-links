# Apt package manager helpers, along with packages
class links::packages{

  # Ensure Apt is installed and updates
    class { 'apt':
      update      => {
        frequency => 'daily',
      },
    } ~>

  # Add the PPA for OCaml on Ubuntu
  apt::ppa { 'ppa:avsm/ppa': } ->
  Package <| |>

  # Ensure we update *before* installing packages
  #exec { "apt-update":
  #  command => "/usr/bin/apt-get update"
  #}
  #Class["apt"] ->
  #Exec["apt-update"] -> Package <| |>

  # OCaml packages
  package { 'ocaml':
    ensure => present
  }

  package { 'ocaml-native-compilers':
    ensure => present
  }

  package { 'camlp4-extra':
    ensure => present
  }

  package { 'opam':
    ensure => present
  }

  # Git
  package { 'git':
    ensure => present
  }
}
