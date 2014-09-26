# == Class: nodejs
#
# Installs nodejs repository and dependencies
#
class nodejs-repo {

  exec { 'install-nodejs-repo':
    command => 'curl -sL https://deb.nodesource.com/setup | sudo bash -',
    path    => ['/bin', '/usr/bin'],
    creates => '/etc/apt/sources.list.d/nodesource.list'
  }
}

class nodejs {

  require nodejs-repo  

  package { 'nodejs':
    ensure => present,
    require => Class['nodejs-repo']
  }

  file { "/usr/bin/node":
    require => Package['nodejs']
  }

}
