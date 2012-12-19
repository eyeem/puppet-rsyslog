# = Class rsyslog
#
class rsyslog (
  $config_dir         = $::rsyslog::params::config_dir,
  $config_dir_mode    = $::rsyslog::params::config_dir_mode,
  $config_file_mode   = $::rsyslog::params::config_file_mode,
  $config_group       = $::rsyslog::params::config_group,
  $config_purge       = $::rsyslog::params::config_purge,
  $config_user        = $::rsyslog::params::config_user,
  $log_dir            = $::rsyslog::params::log_dir,
  $pid_file           = $::rsyslog::params::pid_file,
  $pkg_deps           = $::rsyslog::params::pkg_deps,
  $pkg_ensure         = $::rsyslog::params::pkg_ensure,
  $pkg_list           = $::rsyslog::params::pkg_list,
  $server             = $::rsyslog::params::server,
  $server_log_dir     = $::rsyslog::params::server_log_dir,
  $server_tcp_address = $::rsyslog::params::server_tcp_address,
  $server_tcp_enable  = $::rsyslog::params::server_tcp_enable,
  $server_tcp_port    = $::rsyslog::params::server_tcp_port,
  $server_udp_address = $::rsyslog::params::server_udp_address,
  $server_udp_enable  = $::rsyslog::params::server_udp_enable,
  $server_udp_port    = $::rsyslog::params::server_udp_port,
  $service_dep        = $::rsyslog::params::service_dep,
  $service_enable     = $::rsyslog::params::service_enable,
  $service_ensure     = $::rsyslog::params::service_ensure,
  $service_hasrestart = $::rsyslog::params::service_hasrestart,
  $service_hasstatus  = $::rsyslog::params::service_hasstatus,
  $service_name       = $::rsyslog::params::service_name,
) inherits rsyslog::params {

  class { 'rsyslog::install': } ->
  class { 'rsyslog::config': } ~>
  class { 'rsyslog::server': } ~>
  class { 'rsyslog::service': } ->
  Class['rsyslog']

}

