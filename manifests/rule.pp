# = Define rsyslog::rule
#
define rsyslog::rule (
  $content = undef,
  $ensure  = present,
) {
  File {
    group => $::rsyslog::config_group,
    owner => $::rsyslog::config_user,
    mode  => $::rsyslog::config_mode,
  }

  case $ensure {
    'present': {
      file {
        "${::rsyslog::config_dir}/${name}.conf":
          ensure  => $ensure,
          content => template('rsyslog/rule.conf.erb');
      }
    }

    'absent': {
      file {
        "${::rsyslog::config_dir}/${name}":
          ensure => $ensure;
      }
    }

    default: {
      fail 'No ensure value found for rsyslog rule.'
    }
  }
}

