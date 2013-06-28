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
      content => template("rsyslog/rsyslog.conf.erb");

    $::rsyslog::config_dir:
      ensure  => directory,
      mode    => $::rsyslog::config_dir_mode,
      purge   => $::rsyslog::config_purge,
      recurse => true;

    $::rsyslog::log_dir:
      ensure => directory,
      mode   => $::rsyslog::config_dir_mode;

    $::rsyslog::pid_file:
      ensure => present;
  }

  if $::rsyslog::default_rules == true {
    rsyslog::rule { 'default':
      content => template('rsyslog/50-default.conf.erb')
    }
  }
}

