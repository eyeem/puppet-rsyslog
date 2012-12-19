# = Class rsyslog::server
#
class rsyslog::server {

  if $::rsyslog::server {

    rsyslog::rule { 'server':
      ensure  => present,
      content => template('rsyslog/server.conf.erb');
    }

  }

}

