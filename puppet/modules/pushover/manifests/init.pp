# == Class: pushover
#
class pushover ( $token = 'a6WYAFpjShvjuk4iXpQHer1GdaXsoN', $user = 'uuZoLYYijHYCvEUq6GS7ddYWXmFesX'){
  exec { 'pushover-alert':
    command => "curl -s --form-string \"token=${token}\" --form-string \"user=${user}\" --form-string \"message=Deploy was finished\" https://api.pushover.net/1/messages.json",
    path    => ['/bin', '/usr/bin'],
  }
}
