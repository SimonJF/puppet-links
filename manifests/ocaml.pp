class links::ocaml(
  $username = $links::params::username,
  $ocaml_version = $links::params::ocaml_version
) {

  Exec {
    path => ['/bin', '/sbin', '/usr/bin', '/usr/sbin',
     "/home/vagrant/.opam/$ocaml_version/bin"],
    logoutput => 'on_failure',
    user => $username,
  }

  file {'/etc/environment':
    ensure => file,
    content => "CAML_LD_LIBRARY_PATH=\"/home/vagrant/.opam/$ocaml_version/lib/stublibs\"
MANPATH=\"/home/vagrant/.opam/$ocaml_version/man\"
PERL5LIB=\"/home/vagrant/.opam/$ocaml_version/lib/perl5\"
OCAML_TOPLEVEL_PATH=\"/home/vagrant/.opam/$ocaml_version/lib/toplevel\""
  } ->

  exec {'opam-init':
    command => "opam init",
  } ->

  exec {'compiler-switch':
    command => "opam switch $ocaml_version --yes",
    timeout => 1800
  } ->

  exec {'links-deps':
    command => 'opam install ocamlfind camlp4 lwt deriving',
    timeout => 1800,
  }

}
