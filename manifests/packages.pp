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
