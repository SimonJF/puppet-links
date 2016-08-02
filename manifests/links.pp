class links::links {
  # All commands should be run on the install directory
  Exec {
    path => ["/usr/bin"]
    cwd => "${links::links_installdir}"
  }  

  # Ensure appropriate directories are created before running things
  File <| |> -> Exec <| |>

  # Links install directory must exist
  file { "${links_installdir}":
    ensure => 'directory',
  }

  exec { 'clone':
    command =>"git clone ${links::links_repo_url}"
  } ~>
  exec { 'checkout':
    command => "git checkout ${links::links_branch}"
  }
  # ~> make nc here (also, whoops, need to install deps first)
}
