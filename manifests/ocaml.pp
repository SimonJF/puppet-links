class links::ocaml(
  $username = $links::params::username,
  $ocaml_version = $links::params::ocaml_version
) {

  Exec {
    path => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    logoutput => 'on_failure',
    user => $username,
  }

  exec {'opam-init':
    command => "opam init",
  } ->

  exec {'compiler-switch':
    command => "opam switch $ocaml_version --yes",
    timeout => 1800
  } ->

  exec {'links-deps':
    command => 'opam install camlp4 lwt deriving',
    timeout => 1800,
  } 

}
