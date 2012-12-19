# = Class rsyslog::config
#
class rsyslog::config {
  File {
    require => Class['::rsyslog::install'],
    notify  => Service[$::rsyslog::service_name],
    owner   => $::rsyslog::config_user,
    group   => $::rsyslog::config_group,
    mode    => $::rsyslog::config_file_mode,
  }

  file {
    '/etc/rsyslog.conf':
      ensure  => present,
      content => template("rsyslog/rsyslog.${::osfamily}.conf");

    $::rsyslog::config_dir:
      ensure => directory,
      mode   => $::rsyslog::config_dir_mode;

    $::rsyslog::log_dir:
      ensure => directory,
      mode   => $::rsyslog::config_dir_mode;

    $::rsyslog::pid_file:
      ensure => present;
  }

}

