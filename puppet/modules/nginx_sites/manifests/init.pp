# == Class: nginx
#
class nginx_sites {
  file { '/var/www':
    ensure => directory
  }

  file { '/etc/nginx/sites':
    ensure => directory,
    require => Package['nginx']
  }

  file { "sites-enable":
    path => '/etc/nginx/sites-enable',
    recurse => true,
    purge => true,
    force => true,
    ensure  => absent,
    require => Package['nginx']
  }

  nginx_sites::site { ['static-site']: }

}
