# Class: links
# ===========================
#
# Full description of class links here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'links':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
import 'params.pp'
import 'packages.pp'
class links(
  $database_username = $links::params::database_username,
  $database_password = $links::params::database_password,
  $database_name = $links::params::database_name,
  $database_host = $links::params::database_host,
  $ocaml_version = $links::params::ocaml_version,
  $links_installdir = $links::params::links_installdir,
  $links_repo_url = $links::params::links_repo_url,
  $links_branch = $links::params::links_branch
) inherits $links::params {
  include links::packages
  include links::ocaml
  include links::postgres
  #include links::apache
  include links::links
}
