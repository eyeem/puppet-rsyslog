# = Class rsyslog::server
#
class rsyslog::server {

  if $::rsyslog::server {

    # Detect port conflicts when both TCP and UDP are enabled.
    if $::rsyslog::server_tcp_enable and $::rsyslog::server_udp_enable {
      if $::rsyslog::server_tcp_port == $::rsyslog::server_udp_port {
        if $::rsyslog::server_tcp_address == $::rsyslog::server_udp_address {
          fail 'Can not bind RSyslog daemon to identical ports.'
        }
      }
    }

    rsyslog::rule { 'server':
      ensure  => present,
      content => template('rsyslog/server.conf.erb');
    }

    file { $::rsyslog::server_log_dir:
      ensure => directory,
      mode   => $::rsyslog::config_dir_mode;
    }

  }

}

