# == Class: nginx
#
class nginx {
  package { ['nginx']:
    ensure => present;
  }

  service { 'nginx':
    ensure  => running,
    hasrestart => true,
    require => Package['nginx'];
  }

  file { '/etc/nginx/nginx.conf':
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'];
  }

}
