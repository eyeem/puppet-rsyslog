# = Class rsyslog::server
#
class rsyslog::server {

  $server             = $::rsyslog::server
  $server_log_dir     = $::rsyslog::server_log_dir
  $server_tcp_address = $::rsyslog::server_tcp_address
  $server_tcp_enable  = $::rsyslog::server_tcp_enable
  $server_tcp_port    = $::rsyslog::server_tcp_port
  $server_udp_address = $::rsyslog::server_udp_address
  $server_udp_enable  = $::rsyslog::server_udp_enable
  $server_udp_port    = $::rsyslog::server_udp_port

  if $server {

    # Detect port conflicts when both TCP and UPD are enabled.
    if $server_tcp_enable and $server_udp_enable {
      if $server_tcp_port == $server_udp_port {
        if $server_tcp_address == $server_udp_address {
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

