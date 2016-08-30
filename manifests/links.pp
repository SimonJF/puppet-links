class links::links(
  $links_installdir = $links::params::links_installdir,
  $links_repo_url = $links::params::links_repo_url,
  $links_branch = $links::params::links_branch,
  $ocaml_version = $links::params::ocaml_version,
  $username = $links::params::username,
 ) {
  # All commands should be run on the install directory
  Exec {
    path => ["/usr/bin", "/bin", "/sbin",
     "/home/vagrant/.opam/$ocaml_version/bin"],
    user => $username,
  }

  $links_gitdir = "${links_installdir}/links"

  # Ensure appropriate directories are created before running things
  # File <| |> -> Exec <| |>

  # Links install directory must exist
  file { $links_installdir:
    ensure => directory,
  } ->

  # Links repo must not
  file { "$links_installdir/links":
    ensure  => absent,
    recurse => true,
    purge   => true,
    force   => true
  } ->

  exec { 'clone':
    command => "git clone $links_repo_url",
    cwd => $links_installdir,
  } ->

  exec { 'checkout':
    command => "git checkout $links_branch",
    cwd => $links_gitdir,
  } ->

  exec { 'make':
    command => "make nc",
    cwd => $links_gitdir,
  } ->

  # Next, copy all of the examples files to /var/www
  file { '/var/www':
    ensure  => present,
    source  => "/vagrant/links/examples",
    recurse => true
  }

  # And ensure that the links exec scripts are in cgi-bin
  file { '/usr/lib/cgi-bin':
    

  }
}
