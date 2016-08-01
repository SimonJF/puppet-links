#!/usr/bin/env bash
puppet module uninstall puppet-links
puppet module build
puppet module install pkg/puppet-links-0.1.0.tar.gz
