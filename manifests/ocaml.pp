class links::ocaml {

  Exec {
    path => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
    logoutput => 'on_failure',
  }

  exec {'opam-init':
    command => "opam init",
  } ~>

  exec {'update-env':
    command => "eval `opam config env`",
  } ~>

  exec {'compiler-switch':
    command => "opam switch ${links::ocaml_version}",
  } ~>

  exec {'links-deps':
    command => 'opam install m4 camlp4 lwt deriving'
  }
}
