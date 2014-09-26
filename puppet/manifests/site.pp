# create a new run stage to ensure certain modules are included first
stage { 'pre':
  before => Stage['main']
}

# create a new run stage to PushOver alert
stage { 'final':
  require => Stage['main']
}

# add the baseconfig module to the new 'pre' run stage
class { 'baseconfig':
  stage => 'pre'
}

class { 'pushover':
  stage => 'final'
}

# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}

include baseconfig, nginx, nginx_sites, nodejs, pushover
#, apache, mysql, php, apache_vhosts
