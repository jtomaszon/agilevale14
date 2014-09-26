define nginx_sites::site() {
  file {
    "/etc/nginx/sites/${name}":
      source  => "puppet:///modules/nginx_sites/${name}",
      require => Package['nginx'],
      notify  => Service['nginx'];

    "/var/www/${name}":
      ensure => link,
      target => "/vagrant/sites/${name}";
  }
}
