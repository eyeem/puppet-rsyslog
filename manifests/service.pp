# = Class rsyslog
#
class rsyslog::service {
  if $::rsyslog::service_dep {
    service { $::rsyslog::service_dep:
      ensure    => $::rsyslog::service_ensure,
      enable    => $::rsyslog::service_enable,
      hasstatus => $::rsyslog::service_hasstatus,
      require   => Class['::rsyslog::config'];
    }

    service { $::rsyslog::service_name:
      ensure    => $::rsyslog::service_ensure,
      enable    => $::rsyslog::service_enable,
      hasstatus => $::rsyslog::service_hasstatus,
      require   => [
        Service['::rsyslog::service_dep'],
        Class['::rsyslog::config'],
      ];
    }
  } else {
    service { $::rsyslog::service_name:
      ensure    => $::rsyslog::service_ensure,
      enable    => $::rsyslog::service_enable,
      hasstatus => $::rsyslog::service_hasstatus,
      require   => Class['::rsyslog::config'];
    }
  }
}

