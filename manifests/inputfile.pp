# = Define rsyslog::inputfile
#
define rsyslog::inputfile (
  $inputfilename,
  $inputfiletag,
  $ensure             = present,
  $inputfilestatefile = "stat-${name}",
  $inputfileseverity  = 'notice',
  $inputfilefacility  = 'local0',
) {
  File {
    group => $::rsyslog::config_group,
    owner => $::rsyslog::config_user,
    mode  => $::rsyslog::config_mode,
  }

  case $ensure {
    'present': {
      file { "${::rsyslog::config_dir}/${name}.conf":
        ensure  => $ensure,
        content => template('rsyslog/inputfile.conf.erb');
      }
    }

    'absent': {
      file { "${::rsyslog::config_dir}/${name}.conf":
        ensure => $ensure,
      }
    }

    default: {
      fail 'No ensure value found for rsyslog inputfile.'
    }
  }
}

