# = Class rsyslog::params
#
class rsyslog::params {

  $server = false

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Scientific', 'OEL', 'Amazon', 'Fedora': {
      $config_dir         = '/etc/rsyslog.d'
      $config_dir_mode    = '0755'
      $config_group       = 'root'
      $config_mode        = '0644'
      $config_user        = 'root'
      $log_dir            = ''
      $pid_file           = ''
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = ''
      $service_dep        = undef
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = ''
      $service_hasstatus  = ''
      $service_name       = 'rsyslog'
    }

    'Debian', 'Ubuntu': {
      $config_dir         = '/etc/rsyslog.d'
      $config_dir_mode    = '0755'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $log_dir            = '/var/log'
      $pid_file           = '/var/run/rsyslogd.pid'
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = 'rsyslog'
      $service_dep        = undef
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = true
      $service_hasstatus  = true
      $service_name       = 'rsyslog'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }

}

