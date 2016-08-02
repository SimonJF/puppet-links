class links::links(
  $links_installdir = $links::params::links_installdir,
  $links_repo_url = $links::params::links_repo_url,
  $links_branch = $links::params::links_branch,
  $username = $links::params::username,
 ) {
  # All commands should be run on the install directory
  Exec {
    path => ["/usr/bin"],
    user => $username,
  }  

  $links_gitdir = "${links_installdir}/links"

  # Ensure appropriate directories are created before running things
  # File <| |> -> Exec <| |>

  # Links install directory must exist
  file { $links_installdir:
    ensure => directory,
  } ~>

  exec { 'clone':
    command => "git clone $links_repo_url",
    cwd => $links_installdir,
  } ~>

  exec { 'checkout':
    command => "git checkout $links_branch",
    cwd => $links_gitdir,
  } ~>

  exec { 'make':
    command => "make nc",
    cwd => $links_gitdir,
  }
}
